//
//  ViewController.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    let cities: [City] = CitiesData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        for city in cities {
            let pin = MKPointAnnotation()
            pin.title = city.name
            pin.coordinate = city.coordinates
            map.addAnnotation(pin)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let city = view.annotation?.title, let localisation = view.annotation?.coordinate {
            
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: “DetailsViewController”) as? DetailsViewController
//            vc?.city = City(name: _city ?? “Unknown city name”, coordinates: _coords)
//            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }


}

