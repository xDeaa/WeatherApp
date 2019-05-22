//
//  HeaderCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var resumeLabel: UILabel!
    
    func setTemperature(image:String?,temperature:String?,resume:String?){
        self.icon.image = UIImage(named: "\(image ?? "").png")
        self.temperatureLabel.text = "\(temperature ?? "")°C"
        self.resumeLabel.text = resume ?? ""
    }
}
