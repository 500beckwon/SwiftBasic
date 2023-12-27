//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: .white)
            
            VStack(spacing: 10) {
                CityTextView(cityName: "Cuperitono, CA")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 4)
              
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
                    print("tapped")
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backGroundColor: .white
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

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

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

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct WeatherDayView:  View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)도")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

