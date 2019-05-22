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

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var localisation: UILabel!
    var _city : City = City(name: "Aucune", coordinates: CLLocationCoordinate2D(latitude: 000, longitude: 000))
    var latitude: String  = ""
    var longitude: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = _city.name
        self.latitude = String(_city.coordinates.latitude)
        self.longitude = String(_city.coordinates.longitude)
        self.city.text = _city.name
        self.localisation.text = "\(latitude) , \(longitude)"
        
    }
}
