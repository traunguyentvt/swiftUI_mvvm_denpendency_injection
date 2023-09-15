//
//  MockWeathAPI.swift
//  DependencyInjectionTests
//
//  Created by VT on 9/15/23.
//

import Foundation
import CoreLocation
@testable import DependencyInjection

class MockWeathAPI: IAPI {
    func fetchCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherRawData {
        guard let data = FileLoader.readLocalFile("weatherData") else {
            fatalError("Unable to load file \"weatherData.json\" in main bundle")
        }
        return FileLoader.loadJson(data)
    }
}
