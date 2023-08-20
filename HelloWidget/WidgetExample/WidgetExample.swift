//
//  WidgetExample.swift
//  WidgetExample
//
//  Created by ByungHoon Ann on 2023/05/05.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    // getSnapshot 전에 보여줄 데이터
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), texts: [], configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let count = AppWidgetStyle.widgetSlotCount(style: context.family)
        NetworkService.shared.getTexts(count: 6) { texts in
            let entry = SimpleEntry(date: Date(), texts: texts, configuration: configuration)
            completion(entry)
        }
    }

    // 위젯 업데이트 시기 설정
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        NetworkService.shared.getTexts { texts in
            let currentDate = Date()
            
            let entry = SimpleEntry(date: currentDate, texts: texts, configuration: configuration)
            let nextRefresh = Calendar.current.date(byAdding: .second, value: 3, to: currentDate)!
            let timeline = Timeline(entries: [entry], policy: .after(nextRefresh))
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let texts: [String]
    let configuration: ConfigurationIntent
}

struct WidgetExampleEntryView : View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.widgetFamily) var widgetFamily: WidgetFamily
    
    var entry: Provider.Entry
    var randomColor: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
    
    let testKey: String = "WidgetExample://deeplink?text="
    
    var body: some View {
        
         sizeBody()
        
    }
    
    @ViewBuilder
    func sizeBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            VStack {
                Text("small")
                Text(entry.date, style: .time)
            }
        case .systemMedium:
            VStack {
                HStack {
                    ForEach(0...(min(0, entry.texts.count)), id: \.self) { index in
                        if entry.texts.isEmpty {
                            EmptyView()
                        } else {
                            let text = entry.texts[index]
                            randomColor.opacity(0.5)
                            Text(text)
                                .lineLimit(1)
                        }
                    }
                }
                
                HStack {
                    ForEach(0...(min(0, entry.texts.count)), id: \.self) { index in
                        if entry.texts.isEmpty {
                             EmptyView()
                        } else {
                            let text = entry.texts[index]
                            randomColor.opacity(0.5)
                            Text(text)
                                .lineLimit(1)
                        }
                    }
                }
            }
       
        default:
            EmptyView()
        }
    }
    
    private func getPercentEcodoedString(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
      }
    
}

struct WidgetExample: Widget {
    let kind: String = "WidgetExample"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetExampleEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies(AppWidgetStyle.widgetStyles())
    }
}

struct WidgetExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetExampleEntryView(entry: SimpleEntry(date: Date(),
                                                  texts: [],
                                                  configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct AppWidgetStyle {
    static func widgetSlotCount(style: WidgetFamily) -> Int {
        switch style {
        case .systemSmall:
            return 1
        case .systemMedium:
            return 6
        default:
            return 1
        }
    }
    static func widgetStyles() -> [WidgetFamily] {
        var basicStyle: [WidgetFamily] = [.systemSmall, .systemMedium]
            
        if #available(iOS 16.0, *) {
            return basicStyle + [.systemLarge, .systemExtraLarge, .accessoryCircular]
        }
        
        if #available(iOS 15.0, *) {
            return basicStyle + [.systemLarge, .systemExtraLarge]
        }
        
        return basicStyle
    }
}
