//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack(spacing: 10) {
                CityTextView(cityName: "Cuperitono, CA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 4)
              
                Spacer()
                
                HStack(spacing: 10) {
                    WeatherDayView(
                        dayOfWeek: "화",
                        imageName: "cloud.sun.fill",
                        temperature: 4
                    )
                    
                    WeatherDayView(
                        dayOfWeek: "수",
                        imageName: "sun.max.fill",
                        temperature: 6
                    )
                    
                    WeatherDayView(
                        dayOfWeek: "목",
                        imageName: "wind.snow",
                        temperature: 3
                    )
                    WeatherDayView(
                        dayOfWeek: "금",
                        imageName: "sunset.fill",
                        temperature: 5
                    )
                    WeatherDayView(
                        dayOfWeek: "토",
                        imageName: "snow",
                        temperature: -1
                    )
                }
                Spacer()
                
                Button  {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .white,
                        backGroundColor: .mint
                    )
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

