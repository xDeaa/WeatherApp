//
//  DailyCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var temperatureMin: UILabel!
    
    func setData(data: Datum?){
        self.icon.image = UIImage(named: data?.icon ?? "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.daysLabel.text = dateFormatter.string(from: data?.time ?? Date.init())
        self.temperatureMax.text = "\(data?.temperatureMax?.rounded() ?? 00.00)°C"
        self.temperatureMin.text = "\(data?.temperatureMin?.rounded() ?? 00.00)°C"
    }
}
