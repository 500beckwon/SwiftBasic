//
//  WidgetExampleLiveActivity.swift
//  WidgetExample
//
//  Created by ByungHoon Ann on 2023/05/05.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetExampleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

//struct WidgetExampleLiveActivity: Widget {
//    var body: some WidgetConfiguration {
//        if #available(iOS 16.1, *) {
//            ActivityConfiguration(for: WidgetExampleAttributes.self) { context in
//                // Lock screen/banner UI goes here
//                VStack {
//                    Text("Hello")
//                }
//                .activityBackgroundTint(Color.cyan)
//                .activitySystemActionForegroundColor(Color.black)
//
//            } dynamicIsland: { context in
//
//                DynamicIsland {
//                    // Expanded UI goes here.  Compose the expanded UI through
//                    // various regions, like leading/trailing/center/bottom
//                    DynamicIslandExpandedRegion(.leading) {
//                        Text("Leading")
//                    }
//                    DynamicIslandExpandedRegion(.trailing) {
//                        Text("Trailing")
//                    }
//                    DynamicIslandExpandedRegion(.bottom) {
//                        Text("Bottom")
//                        // more content
//                    }
//                } compactLeading: {
//                    Text("L")
//                } compactTrailing: {
//                    Text("T")
//                } minimal: {
//                    Text("Min")
//                }
//                .widgetURL(URL(string: "http://www.apple.com"))
//                .keylineTint(Color.red)
//            }
//        } else {
//
//        }
//    }
//}
//
//struct WidgetExampleLiveActivity_Previews: PreviewProvider {
//    static let attributes = WidgetExampleAttributes(name: "Me")
//    static let contentState = WidgetExampleAttributes.ContentState(value: 3)
//
//    static var previews: some View {
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
//            .previewDisplayName("Island Compact")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
//            .previewDisplayName("Island Expanded")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
//            .previewDisplayName("Minimal")
//        attributes
//            .previewContext(contentState, viewKind: .content)
//            .previewDisplayName("Notification")
//    }
//}
