//
//  WeatherRawData.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation

struct WeatherRawData: Codable {
    var name: String
    var timezone: Double
    var weather: [WeatherData]
    var main: MainData
    var wind: WindData
    var clouds: CloudsData
    
    
    struct WeatherData: Codable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainData: Codable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindData: Codable {
        var speed: Double
        var deg: Double
    }
    
    struct CloudsData: Codable {
        var all: Double
    }
}
