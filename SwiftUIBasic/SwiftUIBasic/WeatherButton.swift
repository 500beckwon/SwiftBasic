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
        VStack(spacing: 20) {
            Text(title)
                .frame(width: 200, height: 50)
                .background(backGroundColor.gradient)
                .cornerRadius(10)
            
            Text(title)
                .frame(width: 200, height: 50)
                .background(backGroundColor.gradient)
                .cornerRadius(10)
            
        }.foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backGroundColor: .blue)
    }
}
