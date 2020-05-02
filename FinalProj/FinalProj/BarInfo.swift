//
//  BarInfo.swift
//  FinalProj
//
//  Created by user168934 on 4/22/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import Foundation

extension ReportViewController
{
    struct Holder {
        static var _myComputedProperty:Bool = false
    }
    var myComputedProperty:Bool {
        get {
            return Holder._myComputedProperty
        }
        set(newValue) {
            Holder._myComputedProperty = newValue
        }
    }
    
}
    
    
    
    
    
    func getBarInfo(latitude: Double,
                    longitude: Double,
                    category: String,
                    limit: Int,
                    sortBy: String,
                    locale: String,
                    completionHandler: @escaping ([BarInfo]?, Error?) -> Void) {
    
        let apikey = "EtkRr_dku6GjuLrAmFzYQSHwL0Ck9qlxpv4hHylnPLqCG-G8vISGnSrcgg8rH-poepEfBY03CTj5CAS579MlTM3jdw3tsxUbR-wE8A_UduGQUmvWWZ-rs-_EcXegXnYx"

    let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"
    
    let url = URL(string: baseURL)
    
    var request = URLRequest(url: url!)
    request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    
    //initialize session
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let error = error {
        completionHandler(nil, error)
    }
    do{
    //read data as json
        let json = try JSONSerialization.jsonObject(with: data!, options: [])
    //main dictionary
    guard let resp = json as? NSDictionary else { return }
    
    //Bar business
    guard let bars = resp.value(forKey: "bars") as? [NSDictionary] else {return}
    
    var barList: [BarInfo] = []
    
    //access info
    for barinfo in bars {
    
        var bar = BarInfo()
        bar.name = barinfo.value(forKey: "name") as? String
        bar.ID = barinfo.value(forKey: "id") as? Int
        bar.rating = barinfo.value(forKey: "rating") as? Float
        bar.price = barinfo.value(forKey: "price") as? String
        bar.distance = barinfo.value(forKey: "distance") as? Double
    
    let address = barinfo.value(forKeyPath: "location.display_address") as? [String]
    bar.address = address?.joined(separator: "\n" )
    
    barList.append(bar)
    
    
    }
    
    
    completionHandler(barList, nil)
    
    } catch {
        print( "Error" )
    }
    }.resume()
    
}


