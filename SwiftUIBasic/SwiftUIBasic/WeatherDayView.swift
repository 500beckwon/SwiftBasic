//
//  WeatherDayView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/27/23.
//

import SwiftUI

struct WeatherDayView:  View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding()
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)도")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
