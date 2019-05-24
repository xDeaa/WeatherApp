//
//  BaseUIView.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 24/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class BaseBgColor {
    
    static func changeColor(target: UIView,image: String, labels: [UILabel] ){
        switch image {
        case "fog":
            target.backgroundColor = UIColor(red:0.55, green:0.55, blue:0.58, alpha:0.6)
        case "clear-day":
            target.backgroundColor = UIColor(red:0.02, green:0.42, blue:0.82, alpha:0.7)
        case "clear-night":
            target.backgroundColor = UIColor(red:0.21, green:0.45, blue:0.69, alpha:1.0)
            setColorLabel(labels: labels)
        case "cloudy":
            target.backgroundColor = UIColor(red:0.32, green:0.52, blue:0.64, alpha:0.5)
        case "partly-cloudy-day":
            target.backgroundColor = UIColor(red:0.35, green:0.61, blue:0.80, alpha:1.0)
        case "partly-cloudy-night":
            target.backgroundColor = UIColor(red:0.01, green:0.26, blue:0.51, alpha:1.0)
            setColorLabel(labels: labels)
        case "rain":
            target.backgroundColor = UIColor(red:0.62, green:0.80, blue:0.82, alpha:0.6)
        case "sleet":
            target.backgroundColor = UIColor(red:0.04, green:0.58, blue:0.64, alpha:1.0)
        case "snow":
            target.backgroundColor = UIColor(red:0.92, green:0.95, blue:0.98, alpha:1.0)
        case "wind":
            target.backgroundColor = UIColor(red:0.92, green:0.95, blue:0.98, alpha:0.6)
        default:
            target.backgroundColor = UIColor.white
        }
    }
    
    static func setColorLabel(labels: [UILabel]){
        for label in labels {
            label.textColor = UIColor.white
        }
    }
}
