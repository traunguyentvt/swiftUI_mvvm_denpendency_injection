//
//  WeatherModel.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation

struct WeatherModel {
    var locationName: String
    var weatherName: String
    var description: String
    var temperature: Double
    var timeOffUtc: Double
    
    init(data: WeatherRawData) {
        locationName = data.name
        weatherName = data.weather.first?.main ?? ""
        description = data.weather.first?.description ?? ""
        temperature = data.main.temp
        timeOffUtc = data.timezone
    }
}
