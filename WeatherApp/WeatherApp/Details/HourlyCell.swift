//
//  HourlyCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class HourlyCell: UITableViewCell {

    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temp: UIImageView!
    @IBOutlet weak var humidity: UIImageView!
    
    func setData(data: Currently?, theme: String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        self.icon.image = UIImage(named:data?.icon ?? "")
        self.humidity.image = UIImage(named: "humidity.png")
        if let _humidity = data?.humidity {
            self.humidityLabel.text = "\((_humidity * 100).toRoundString())"
        }
        self.hoursLabel.text = dateFormatter.string(from: data?.time ?? Date.init()) + "H"
        self.temperatureLabel.text = "\(data?.temperature?.toRoundString() ?? "")°C"

        if data?.temperature ?? 0.0 > 18.0 {
            self.temp.image = UIImage(named: "hot.png")
        } else {
            self.temp.image = UIImage(named: "cold.png")
        }
        
        BaseBgColor.changeColor(target: self.contentView, image: theme, labels: [temperatureLabel,humidityLabel,hoursLabel])
    }
}
