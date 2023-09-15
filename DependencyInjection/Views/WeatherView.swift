//
//  WeatherView.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import SwiftUI

struct WeatherView: View {

    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Current weather in Cities")
                Button("New York") {
                    Task {
                        await weatherViewModel.weatherForCity(currentCity: .newyork)
                    }
                }
                Button("London") {
                    Task {
                        await weatherViewModel.weatherForCity(currentCity: .london)
                    }
                }
            }
            .padding(.top, 20)
            
            ContentView(weatherViewModel: weatherViewModel)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weatherViewModel: WeatherViewModel(weatherAPI: WeatherAPI()))
    }
}
