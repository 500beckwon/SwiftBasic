//
//  WidgetSmallView.swift
//  HelloWidget
//
//  Created by ByungHoon Ann on 2023/05/07.
//

import WidgetKit
import SwiftUI

extension URL {
    static func getPercentEcododingString(_ string: String) -> String {
        string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    static func getPercentEcododingURL(_ urlString: String) -> URL? {
        return URL(string: getPercentEcododingString(urlString))
    }
}

struct WidgetSmallEntryView: View {
    let text: String
    var body: some View {
        VStack {
            Color.blue.opacity(0.7)
            Text(text)
                .foregroundColor(.red)
                .lineLimit(1)
                .widgetURL(.getPercentEcododingURL("WidgetExample://deeplink?text=\(text)"))
        }.padding()
    }
}

struct WidgetMediumEntryView: View {
    let texts: [String]
    let testKey: String = "WidgetExample://deeplink?text="
    
    var body: some View {
        
        VStack {
            HStack {
                    Color.orange.opacity(0.7)
                    Text(texts[0])
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[0]))
                    
                    Color.red.opacity(0.7)
                    Text(texts[1])
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[1]))
                    
                    Color.blue.opacity(0.7)
                    Text(texts[2])
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[2]))
                
            }.padding()
            
            Spacer()
            
            HStack {
                
                    Color.black.opacity(0.7)
                    Text(texts[3])
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[3]))
                    
                    Color.gray.opacity(0.7)
                    Text(texts[4])
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[4]))
                    
                    Color.yellow.opacity(0.7)
                    Text(texts[5])
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .widgetURL(.getPercentEcododingURL(testKey+texts[5]))
                
            }.padding()
        }
    }
}
