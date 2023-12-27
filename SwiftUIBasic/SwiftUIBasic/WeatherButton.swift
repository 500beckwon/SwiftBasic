//
//  WeatherButton.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/27/23.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backGroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
    }
}
