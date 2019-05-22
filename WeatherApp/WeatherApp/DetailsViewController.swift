//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
import CoreLocation
class DetailsViewController: UIViewController {

    var _city : City = City(name: "Aucune", coordinates: CLLocationCoordinate2D(latitude: 000, longitude: 000))
    var latitude: String  = ""
    var longitude: String = ""
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = _city.name
        self.latitude = String(_city.coordinates.latitude)
        self.longitude = String(_city.coordinates.longitude)
        requestWeather(latitude: self.latitude, longitude: self.longitude)
    }
    
    func requestWeather(latitude:String,longitude:String){
        RequestManager.getData(uri:"https://api.darksky.net/forecast/04018ef3bc82525aa23cb62077890bc1/\(latitude),\(longitude)?UNITS=si", success: { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            self.weather = try? decoder.decode(Weather.self, from: data)
            print(self.weather)
        }){ (Error) in
            print(Error)
        }

    }
}
