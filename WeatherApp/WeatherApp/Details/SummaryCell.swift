//
//  SummaryCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var forecast: UILabel!
    
    func setSummarry(name: String?,image: String){
        self.forecast.text = name ?? ""
        BaseBgColor.changeColor(target: self.contentView, image: image, labels: [forecast])
    }
}
