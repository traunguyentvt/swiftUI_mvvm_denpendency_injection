//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    private let weatherViewModel = WeatherViewModel(weatherAPI: WeatherAPI())
    
    var body: some Scene {
        WindowGroup {
            WeatherView(weatherViewModel: weatherViewModel)
        }
    }
}
