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
            LinearGradient(
                gradient: Gradient(colors: [.blue, .white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            
            VStack(spacing: 10) {
                Text("Cuperitono, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Text("4도")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                
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
                    Text("Change Day Time")
                }
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
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

//#Preview {
//    ContentView()
//}
