//
//  DailyCollectionCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 23/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class DailyCollectionCell: UICollectionViewCell{

    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var min: UIImageView!
    @IBOutlet weak var max: UIImageView!
    
    func setData(data: Datum?){
        
        self.icon.image = UIImage(named: data?.icon ?? "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.daysLabel.text = dateFormatter.string(from: data?.time ?? Date.init())
        self.temperatureMax.text = "\(data?.temperatureMax?.toRoundString() ?? "")°C"
        self.temperatureMin.text = "\(data?.temperatureMin?.toRoundString()  ?? "")°C"
        self.min.image = UIImage(named: "cold.png")
        self.max.image = UIImage(named: "hot.png")
        BaseBgColor.changeColor(target: self.view, image: data?.icon ?? "",labels:[daysLabel,temperatureMin,temperatureMax])
    }
}

extension Double {
    func toRoundString() -> String {
        return String(format: "%.0f", self)
    }
}
