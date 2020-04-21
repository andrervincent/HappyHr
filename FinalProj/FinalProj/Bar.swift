//
//  Bar.swift
//  FinalProj
//
//  Created by Andre Vincent on 4/20/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import Foundation
import UIKit

class Bar {
    /*
     This is the utility class for bars.
     Bars will also be saved to the DB,
     but this data model will help structure query objects to retrieve,
     store, and update Bar objects
     */
    
    var name: String
    var id: String
    var hoursOpen: String
    var photo: UIImage?
    var reviews: [String]
    var drinks: [String]
    var location: String
    var priceRange: String
    
    init?(name: String, id: String, hoursOpen: String, photo: UIImage,
         reviews:[String], drinks: [String], location: String, priceRange: String) {
        
        self.name = name
        self.id = id
        self.hoursOpen = hoursOpen
        self.photo = photo
        self.reviews = reviews
        self.drinks = drinks
        self.location = location
        self.priceRange = priceRange
        
        // initialization should fail if there is no assigned ID
        if (self.id.isEmpty) {return nil}
    }
    
    
}
