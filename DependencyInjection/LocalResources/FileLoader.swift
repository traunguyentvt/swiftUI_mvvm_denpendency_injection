//
//  FileLoader.swift
//  DependencyInjection
//
//  Created by VT on 9/15/23.
//

import Foundation

class FileLoader {
    static func readLocalFile(_ fileName: String) -> Data? {
        guard let file = Bundle.main.path(forResource: fileName, ofType: "json") else {
            fatalError("Unable to locate file \"\(fileName)\" in main bundle.")
        }
        
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to load \"\(fileName)\" from main bundle \n \(error.localizedDescription)")
        }
    }
    
    static func loadJson(_ data: Data) -> WeatherRawData {
        do {
            let weather = try JSONDecoder().decode(WeatherRawData.self, from: data)
//            debugPrint(weather)
            return weather
        } catch {
            fatalError("Unable to decode data to \(WeatherRawData.self)\n\(error.localizedDescription)")
        }
    }
}
