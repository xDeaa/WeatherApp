//
//  ExtraInfoCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class ExtraInfoCell: UITableViewCell {
    @IBOutlet weak var leftInfo: UILabel!
    @IBOutlet weak var rightInfo: UILabel!
    @IBOutlet weak var leftValue: UILabel!
    @IBOutlet weak var rigthValue: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func setInfo(titleLeft: String?,value: Currently?,tilteRigth: String?,theme: String){
        self.leftInfo.text = titleLeft ?? ""
        self.rightInfo.text = tilteRigth ?? ""
        
        switch leftInfo.text {
        case "Humidity":
            if let _humidity = value?.humidity {
                self.leftValue.text = (_humidity * 100).toRoundString()
                self.icon.image = UIImage(named: "humidity.png")
            }
        case "Pressure":
            self.leftValue.text = "\(value?.pressure ?? 00.00) hPA"
        default:
            self.leftValue.text = "-"
        }
        
        switch rightInfo.text {
        case "Wind Speed":
            self.rigthValue.text = "\(value?.windSpeed ?? 00.00) km/h"
        case "UV Index":
            self.rigthValue.text = "\(value?.uvIndex ?? 0)"
        default:
            self.leftValue.text = "-"
        }
        BaseBgColor.changeColor(target: self.contentView, image: theme, labels: [leftInfo,leftValue,rightInfo,rigthValue])
        
    }
}
