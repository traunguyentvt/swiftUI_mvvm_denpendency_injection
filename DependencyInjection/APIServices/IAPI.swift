//
//  IAPI.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation
import CoreLocation

protocol IAPI {
    func fetchCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherRawData
}
