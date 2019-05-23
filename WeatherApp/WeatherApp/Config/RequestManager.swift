//
//  RequestManager.swift
//  WeatherApp
//
//  Created by Andrea SERRANO on 22/05/2019.
//  Copyright © 2019 Andrea SERRANO. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

struct RequestManager{
    
    static func getData(uri: String,success: @escaping (Data)->(),failure: @escaping (Error)->()) {
        Alamofire.request(
            uri,
            method: .get
            ).responseData(completionHandler: { (dataResponse) in
                switch dataResponse.result {
                case .success(let value):
                    success(value)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
            })
    }
}
