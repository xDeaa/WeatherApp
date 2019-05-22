//
//  City.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import Foundation
import CoreLocation

class City {
    
    var name: String
    var coordinates: CLLocationCoordinate2D
    init(name: String, coordinates:CLLocationCoordinate2D) {
        self.name = name
        self.coordinates = coordinates
    }
}
