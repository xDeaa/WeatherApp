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
    
    func setData(data: Currently?){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        self.icon.image = UIImage(named:data?.icon ?? "")
        if data?.humidity != 0.0 {
            self.humidityLabel.text = "\(data?.humidity ?? 00.01)%"
        }
        self.hoursLabel.text = dateFormatter.string(from: data?.time ?? Date.init())
        self.temperatureLabel.text = "\(data?.temperature?.rounded() ?? 00.00)°C"
    }
}
