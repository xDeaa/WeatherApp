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
        initTableView()
        requestWeather(latitude: self.latitude, longitude: self.longitude)
    }
    
    func initTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SummaryCell", bundle: nil), forCellReuseIdentifier: "summaryCell")
        tableView.register(UINib(nibName: "DailyCell", bundle: nil), forCellReuseIdentifier: "dailyCell")
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "hourlyCell")
        tableView.register(UINib(nibName: "ExtraInfoCell", bundle: nil), forCellReuseIdentifier: "extraCell")
    }
    
    func requestWeather(latitude:String,longitude:String){
        RequestManager.getData(uri:"https://api.darksky.net/forecast/04018ef3bc82525aa23cb62077890bc1/\(latitude),\(longitude)?units=si", success: { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            self.weather = try? decoder.decode(Weather.self, from: data)
            self.tableView.reloadData()
            print(self.weather ?? "" )
        }){ (Error) in
            print(Error)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderCell {
                headerCell.setTemperature(data: self.weather?.currently)
                return headerCell
            }
            
        case 1:
            if indexPath.row == 0 {
                return initSummaryCell(param: self.weather?.hourly?.summary, indexPath: indexPath)
            }else{
                if let hourlyCell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath) as? HourlyCell {
                    hourlyCell.setData(data: self.weather?.hourly?.data?[indexPath.row - 1])
                    return hourlyCell
                }
            }
            
        case 2:
            if indexPath.row == 0 {
                return initSummaryCell(param: self.weather?.daily?.summary, indexPath: indexPath)
            }else{
                if let dailyCell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as? DailyCell {
                    dailyCell.dailyDetails = self.weather?.daily?.data
                    return dailyCell
                }
            }
        case 3:
            let extraCell = tableView.dequeueReusableCell(withIdentifier: "extraCell", for: indexPath) as? ExtraInfoCell
            let cell = extraCell ?? UITableViewCell()
            if indexPath.row == 0 {
                extraCell?.setInfo(titleLeft: "Humidity", value: self.weather?.currently, tilteRigth: "Wind Speed")
                return cell
                
            }else{
                extraCell?.setInfo(titleLeft: "Pressure", value: self.weather?.currently, tilteRigth: "UV Index")
                return cell
            }
        default:
            return UITableViewCell()
        }

        return UITableViewCell()
    }
    
    func initSummaryCell(param: String?, indexPath: IndexPath) -> UITableViewCell {
        if let summaryCell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell {
            summaryCell.setSummarry(name: param)
            return summaryCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1 + (self.weather?.hourly?.data?.prefix(24).count ?? 0)
        case 2:
            if (self.weather?.daily?.data?.count ?? 0 > 0) {
                return 2
            } else {
                return 0
            }
        case 3:
            return 2
        default:
            return 1
        }
    }
}
