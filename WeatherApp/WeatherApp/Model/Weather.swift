//
//  Weather.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let latitude, longitude: Double?
    let currently: Currently?
    let hourly: Hourly?
    let daily: Daily?
}

struct Currently: Codable {
    let time: Date?
    let summary: String?
    let icon: String?
    let temperature: Double?
    let humidity, pressure, windSpeed: Double?
    let uvIndex: Int?
}

struct Daily: Codable {
    let summary: String?
    let icon: String?
    let data: [Datum]?
}

struct Datum: Codable {
    let time: Date?
    let summary: String?
    let icon: String?
    let temperatureMin, temperatureMax: Double?
}

struct Hourly: Codable {
    let summary: String?
    let icon: String?
    let data: [Currently]?
}

