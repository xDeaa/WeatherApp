//
//  searchBar.swift
//  WeatherApp
//
//  Created by Andrea Serrano on 24/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import UIKit
class SearchBar: UIViewController {
    var matchingItems: CitiesSearch?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "listCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems?.results?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") {
            let selectedItem = matchingItems?.results?[indexPath.row]
            cell.textLabel?.text = selectedItem?.name
            cell.detailTextLabel?.text = "\(selectedItem?.coordinates?.lat ?? 0.0) \(selectedItem?.coordinates?.lng ?? 0.0)"
            return cell
        }
        return UITableViewCell()
    }
}

extension SearchBar : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBarText = searchController.searchBar.text
        RequestManager.getData(uri:"https://api.opencagedata.com/geocode/v1/json?q=\(searchBarText ?? "")&key=17379d2ab6a9424ea2810a59a0acade4", success: { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            self.matchingItems = try? decoder.decode(CitiesSearch.self, from: data)
            print(self.matchingItems ?? "")
            self.tableView.reloadData()

        }){ (Error) in
            print(Error)
        }
    }
}
