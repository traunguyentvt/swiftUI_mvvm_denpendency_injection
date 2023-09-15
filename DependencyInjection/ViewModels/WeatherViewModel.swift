//
//  WeatherViewModel.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private var weatherSearvice: IAPI
    @Published private var weatherModel: WeatherModel
    private(set) var city: String
    
    init(weatherAPI: IAPI) {
        guard let data = FileLoader.readLocalFile("weatherData") else {
            fatalError("Unable to locate file \"weatherData.json\" in main bundle")
        }
        
        let weatherRaw = FileLoader.loadJson(data)
        weatherModel = WeatherModel(data: weatherRaw)
        weatherSearvice = weatherAPI
        city = "not set"
    }
    
    @MainActor
    func weatherForCity(currentCity: City) async {
        city = currentCity.rawValue
        let (lat, lon) = coordinates(for: currentCity)
        
        do {
            let rawWeather = try await weatherSearvice.fetchCurrentWeather(latitude: lat, longitude: lon)
            weatherModel = WeatherModel(data: rawWeather)
        } catch {
            debugPrint("Error fetching weather with '\(currentCity.rawValue)' City\n\(error.localizedDescription)")
        }
    }
    
    private func coordinates(for city: City) -> (Double, Double) {
        switch city {
        case .newyork:
            return (40.749939623101724, -73.98584035140507)
        case .london:
            return (51.48403374752388, -0.0059268752163408114)
        case .paris:
            return  (48.8619958275662, 2.294848578874564)
        case .vancouver:
            return  (49.2791749376975, -123.10359944424778)
        case .capetown:
            return  (-33.96475307519853, 18.417554193804826)
        case .sydney:
            return  (-33.85657055055687, 151.21537180010895)
        }
    }
}

extension WeatherViewModel {
    var location: String {
        get { weatherModel.locationName }
    }
    
    var weatherMain: String {
        get { weatherModel.weatherName }
    }
    
    var description: String {
        get { weatherModel.description }
    }
    
    var temperature: Double {
        get { weatherModel.temperature }
    }
    
    var locationTime: String {
        get {
            let utcDateFormatter = DateFormatter()
            utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            utcDateFormatter.timeStyle = .medium
            let now = Date().addingTimeInterval(weatherModel.timeOffUtc)
            return utcDateFormatter.string(from: now)
        }
    }
    
    var currentCity: String {
        get { city }
    }
}

enum City: String, Identifiable, CaseIterable {
    var id: Self { self }
    
    case newyork = "New York"
    case london = "London"
    case paris = "Paris"
    case vancouver = "Vancouver"
    case capetown = "Cape Town"
    case sydney = "Sydney"
}
