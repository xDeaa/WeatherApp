//
//  DailyCell.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var dailyCollectionView : UICollectionView!
    var dailyDetails: [Datum]?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        initDailyCollectionView()
    }
    
    func initDailyCollectionView() {
        self.dailyCollectionView.dataSource = self
        self.dailyCollectionView.delegate = self
        let dailyCollectionCell = UINib.init(
            nibName: "DailyCollectionCell",
            bundle: nil
        )
        
        self.dailyCollectionView.register(
            dailyCollectionCell,
            forCellWithReuseIdentifier: "DailyCollectionCell"
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dailyDetails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let details = dailyDetails {
            let cell = dailyCollectionView.dequeueReusableCell(withReuseIdentifier: "DailyCollectionCell", for: indexPath) as! DailyCollectionCell
            cell.setData(data: details[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
