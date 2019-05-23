//
//  ListCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 23/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    
    func setCity(city: String){
        self.cityName.text = city
    }
}
