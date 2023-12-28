//
//  MainWeatherStatusView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/27/23.
//

import SwiftUI

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("\(temperature)도")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}


