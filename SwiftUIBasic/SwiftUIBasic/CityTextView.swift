//
//  CityTextView.swift
//  SwiftUIBasic
//
//  Created by dev dfcc on 12/27/23.
//

import SwiftUI

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

