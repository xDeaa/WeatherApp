//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
import CoreLocation
import Lottie

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: AnimationView!
    
    var _city : City = City(name: "Aucune", coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
    var latitude: Double?
    var longitude: Double?
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = _city.name
        self.latitude = _city.coordinates.latitude
        self.longitude = _city.coordinates.longitude
        
        loader.animation = Animation.named("loader")
        loader.loopMode = .loop
        
        initTableView()
        requestWeather(lat: self.latitude, long: self.longitude)
    }
    
    private func initTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SummaryCell", bundle: nil), forCellReuseIdentifier: "summaryCell")
        tableView.register(UINib(nibName: "DailyCell", bundle: nil), forCellReuseIdentifier: "dailyCell")
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "hourlyCell")
        tableView.register(UINib(nibName: "ExtraInfoCell", bundle: nil), forCellReuseIdentifier: "extraCell")
    }
    
    private func requestWeather(lat: Double?, long: Double?) {
        guard let _lat = lat, let _long = long else {
            return
        }
        setLoaderVisible(true)


        RequestManager.getData(uri:"https://api.darksky.net/forecast/04018ef3bc82525aa23cb62077890bc1/\(_lat),\(_long)?units=si", success: { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            self.weather = try? decoder.decode(Weather.self, from: data)
            self.tableView.reloadData()
//            print(self.weather ?? "" )
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.setLoaderVisible(false)
            }
        }){ (Error) in
            print(Error)
            self.setLoaderVisible(false)
        }
    }
    
    func setLoaderVisible(_ isVisible: Bool) {
        loader.isHidden = !isVisible
        tableView.isHidden = isVisible
        if loader.isHidden && loader.isAnimationPlaying {
            loader.stop()
        } else if !loader.isHidden && !loader.isAnimationPlaying {
            loader.play()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var currentIcon = self.weather?.currently?.icon ?? ""
        switch indexPath.section {
        case 0:
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderCell {
                headerCell.setTemperature(data: self.weather?.currently)
                return headerCell
            }
            
        case 1:
            if indexPath.row == 0 {
                return initSummaryCell(param: self.weather?.hourly?.summary, indexPath: indexPath)
            } else {
                if let hourlyCell = tableView.dequeueReusableCell(withIdentifier: "hourlyCell", for: indexPath) as? HourlyCell {
                    hourlyCell.setData(data: self.weather?.hourly?.data?[indexPath.row - 1], theme: currentIcon)
                    return hourlyCell
                }
            }
            
        case 2:
            if indexPath.row == 0 {
                return initSummaryCell(param: self.weather?.daily?.summary, indexPath: indexPath)
            } else {
                if let dailyCell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as? DailyCell {
                    dailyCell.dailyDetails = self.weather?.daily?.data
                    return dailyCell
                }
            }
        case 3:
            let extraCell = tableView.dequeueReusableCell(withIdentifier: "extraCell", for: indexPath) as? ExtraInfoCell
            let cell = extraCell ?? UITableViewCell()
            if indexPath.row == 0 {
                extraCell?.setInfo(titleLeft: "Humidity", value: self.weather?.currently, tilteRigth: "Wind Speed",theme: currentIcon)
                return cell
                
            } else {
                extraCell?.setInfo(titleLeft: "Pressure", value: self.weather?.currently, tilteRigth: "UV Index", theme: currentIcon)
                return cell
            }
        default:
            return UITableViewCell()
        }

        return UITableViewCell()
    }

    func initSummaryCell(param: String?, indexPath: IndexPath) -> UITableViewCell {
        if let summaryCell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? SummaryCell {
            summaryCell.setSummarry(name: param,image: self.weather?.currently?.icon ?? "" )
            return summaryCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _weather = self.weather {
            switch section {
            case 0:
                return 1
            case 1:
                return 1 + (_weather.hourly?.data?.prefix(24).count ?? 0)
            case 2:
                return (_weather.daily?.data?.count ?? 0 > 0) ? 2 : 0
            case 3:
                return 2
            default:
                return 0
            }
        }
        return 0
    }
}
