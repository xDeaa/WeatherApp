//
//  CitiesSearch.swift
//  WeatherApp
//
//  Created by Andrea Serrano on 24/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cities = try? newJSONDecoder().decode(Cities.self, from: jsonData)

import Foundation

// MARK: - Cities
struct CitiesSearch: Codable {
    
    let results: [Result]?
    
    struct Result: Codable {
        let coordinates: Data?
        let name: String?
        enum CodingKeys: String, CodingKey {
            case coordinates = "geometry"
            case name = "formated"
        }
    }

    struct Data: Codable {
        let lat, lng: Double?
    }
}
