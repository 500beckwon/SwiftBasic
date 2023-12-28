//
//  BackgroundView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/27/23.
//

import SwiftUI

struct BackgroundView: View {
  
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.gray.gradient : Color.blue.gradient)
            .ignoresSafeArea()
            
    }
}
