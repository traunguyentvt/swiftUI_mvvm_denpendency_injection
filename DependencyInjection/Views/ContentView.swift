//
//  ContentView.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        List {
            HStack {
                Text("Location")
                    .frame(width: 100, alignment: .trailing)
                    .padding(.horizontal)
                Text(weatherViewModel.location)
            }
            HStack {
                Text("Weather")
                    .frame(width: 100, alignment: .trailing)
                    .padding(.horizontal)
                Text(weatherViewModel.weatherMain)
            }
            HStack {
                Text("Description")
                    .frame(width: 100, alignment: .trailing)
                    .padding(.horizontal)
                Text(weatherViewModel.description)
            }
            HStack {
                Text("Temperature")
                    .frame(width: 100, alignment: .trailing)
                    .padding(.horizontal)
                Text("\(weatherViewModel.temperature) °K")
            }
            HStack {
                Text("Time")
                    .frame(width: 100, alignment: .trailing)
                    .padding(.horizontal)
                Text(weatherViewModel.locationTime)
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weatherViewModel: WeatherViewModel(weatherAPI: WeatherAPI()))
    }
}
