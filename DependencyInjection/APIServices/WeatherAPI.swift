//
//  WeatherAPI.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation
import CoreLocation

class WeatherAPI: IAPI {
    func fetchCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherRawData {
//        guard let appId = Bundle.main.object(forInfoDictionaryKey: "AppId") as? String else {
//            fatalError("AppId must not be empty in plist")
//        }
        
        guard var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather") else {
            fatalError("URL is invalid")
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "appid", value: "bc3a2e5121575cded7b026d0ea2a4d79"),
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "units", value: "metric")
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            fatalError("Error retrieving weather data")
            guard let data = FileLoader.readLocalFile("weatherData") else {
                fatalError("Unable to locate file \"weatherData.json\" in main bundle")
            }
            
            return FileLoader.loadJson(data)
        }
        
        return FileLoader.loadJson(data)
    }
}
