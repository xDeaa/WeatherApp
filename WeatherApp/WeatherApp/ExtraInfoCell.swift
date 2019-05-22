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
    
    func setInfo(titleLeft: String?,value: Currently?,tilteRigth: String?){
        self.leftInfo.text = titleLeft ?? ""
        self.rightInfo.text = tilteRigth ?? ""
        
        switch leftInfo.text {
        case "Humidity":
            self.leftValue.text = "\(value?.humidity ?? 00.0) %"
        case "Pressure":
            self.leftValue.text = "\(value?.pressure ?? 00.0) hPA"
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
        
    }
}
