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
    
    func setTemperature(data: Currently?){
        self.icon.image = UIImage(named: "\(data?.icon ?? "").png")
        self.temperatureLabel.text = "\(data?.temperature?.toRoundString() ?? "")°C"
        self.resumeLabel.text = data?.summary ?? ""
        BaseBgColor.changeColor(target: self.contentView, image: data?.icon ?? "", labels: [temperatureLabel,resumeLabel])
    }
}
