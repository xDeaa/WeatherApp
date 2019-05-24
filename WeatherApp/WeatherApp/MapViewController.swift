//
//  ViewController.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var choiceButton: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    let cities: [City] = CitiesData.list
    var resultSearchController: UISearchController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isHidden = true
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "listCell")
        initSearchBar()
        for city in cities {
            let pin = MKPointAnnotation()
            pin.title = city.name
            pin.coordinate = city.coordinates
            map.addAnnotation(pin)
        }
    }
    
    func initSearchBar(){
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "searchCity") as! SearchBar
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let city = view.annotation?.title, let localisation = view.annotation?.coordinate {
            let detailsController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsCity") as? DetailsViewController
            detailsController?._city = City(name: city ?? "Unknown city name", coordinates: localisation)
            self.navigationController?.pushViewController(detailsController!, animated: true)
        }
    }

    @IBAction func choiceDisplay(_ sender: Any) {
        if choiceButton.selectedSegmentIndex == 1{
            map.isHidden = true
            tableView.isHidden = false
        }else{
            map.isHidden = false
            tableView.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListCell {
            cityCell.setCity(city: cities[indexPath.row].name)
            return cityCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { tableView.deselectRow(at: indexPath, animated: true)
        if !cities.isEmpty {
            let storyBoard = UIStoryboard(name: "Main", bundle:nil)
            let detailsController = storyBoard.instantiateViewController(withIdentifier: "DetailsCity") as! DetailsViewController
            detailsController._city = self.cities[indexPath.row]
            self.navigationController?.pushViewController(detailsController, animated:true)
        }
    }
}

