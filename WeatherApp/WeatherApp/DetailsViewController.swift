//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
import CoreLocation
class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var _city : City = City(name: "Aucune", coordinates: CLLocationCoordinate2D(latitude: 000, longitude: 000))
    var latitude: String  = ""
    var longitude: String = ""
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = _city.name
        self.latitude = String(_city.coordinates.latitude)
        self.longitude = String(_city.coordinates.longitude)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SummaryCell", bundle: nil), forCellReuseIdentifier: "summaryCell")
        tableView.register(UINib(nibName: "DailyCell", bundle: nil), forCellReuseIdentifier: "dailyCell")
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "hourlyCell")
        requestWeather(latitude: self.latitude, longitude: self.longitude)
    }
    
    func requestWeather(latitude:String,longitude:String){
        RequestManager.getData(uri:"https://api.darksky.net/forecast/04018ef3bc82525aa23cb62077890bc1/\(latitude),\(longitude)?units=si", success: { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            self.weather = try? decoder.decode(Weather.self, from: data)
            self.tableView.reloadData()
//            print(self.weather)
        }){ (Error) in
            print(Error)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 1 {
//            return "Titles"
//        }else if section == 2{
//            return "Sibling"
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderCell {
                headerCell.setTemperature(image: self.weather?.currently?.icon, temperature: "\(self.weather?.currently?.temperature?.rounded() ?? 10.0 )" , resume: self.weather?.currently?.summary)
                return headerCell
            }
            
        case 1:
            if indexPath.row == 0 {
                if let summaryCell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell {
                    summaryCell.setSummarry(name: self.weather?.hourly?.summary)
                    return summaryCell
                }
            }else{
                if let hourlyCell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath) as? HourlyCell {
                    hourlyCell.setData(data: self.weather?.hourly?.data?[indexPath.row])
                    return hourlyCell
                }
            }
            
        case 2:
            if indexPath.row == 0 {
                if let summaryCell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell {
                    summaryCell.setSummarry(name: self.weather?.daily?.summary)
                    return summaryCell
                }
            }else{
                if let dailyCell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as? DailyCell {
                    dailyCell.setData(data: self.weather?.daily?.data?[indexPath.row])
                    
                    return dailyCell
                }
            }
        default:
            return UITableViewCell()
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1{
            return self.weather?.hourly?.data?.count ?? 0
        }

        if section == 2 {
            return self.weather?.daily?.data?.count ?? 0
        }
        return 1
    }
}
