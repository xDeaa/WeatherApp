//
//  DailyCollectionCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 23/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class DailyCollectionCell: UICollectionViewCell {

    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var view: UIView!
    
    func setData(data: Datum?){
        
        self.icon.image = UIImage(named: data?.icon ?? "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.daysLabel.text = dateFormatter.string(from: data?.time ?? Date.init())
        self.temperatureMax.text = "\(data?.temperatureMax?.rounded() ?? 00.00)°C"
        self.temperatureMin.text = "\(data?.temperatureMin?.rounded() ?? 00.00)°C"
        changeColor(image: data?.icon ?? "" )
    }
    
    func changeColor(image: String){

        switch image {
        case "fog":
            self.view.backgroundColor = UIColor(red:0.67, green:0.64, blue:0.64, alpha:0.5)
        case "clear-day":
            self.view.backgroundColor = UIColor(red:0.93, green:0.94, blue:0.29, alpha:0.5)
        case "clear-night":
            self.view.backgroundColor = UIColor(red:0.28, green:0.28, blue:0.26, alpha:1.0)
        case "cloudy":
            self.view.backgroundColor = UIColor(red:0.36, green:0.70, blue:0.85, alpha:1.0)
        case "partly-cloudy-day":
            self.view.backgroundColor = UIColor(red:0.91, green:0.94, blue:0.59, alpha:1.0)
        case "partly-cloudy-night":
            self.view.backgroundColor = UIColor(red:0.65, green:0.66, blue:0.59, alpha:1.0)
        case "rain":
            self.view.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.66, alpha:1.0)
        case "sleet":
            self.view.backgroundColor = UIColor(red:0.04, green:0.58, blue:0.64, alpha:1.0)
        case "snow":
            self.view.backgroundColor = UIColor.white
        case "wind":
            self.view.backgroundColor = UIColor.white
        default:
            self.view.backgroundColor = UIColor.white
        }
    }

}
