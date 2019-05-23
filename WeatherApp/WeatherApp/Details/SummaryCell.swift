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
    
    func setSummarry(name: String?){
        self.forecast.text = name ?? ""
    }
}
