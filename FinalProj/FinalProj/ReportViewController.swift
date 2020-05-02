//
//  ReportViewController.swift
//  FinalProj
//
//  Created by user168934 on 4/12/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import Foundation
import UIKit
import Cosmos


class ReportViewController: UIViewController {
    
    @IBOutlet weak var imageField: UIImageView!
    //  all will be import from detail view, as it is whatever bar user selected on to rate/review
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rating: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var distance: UILabel!

    
    @IBOutlet weak var questionField: UILabel!
    
   
       


    override func viewDidLoad() {
    super.viewDidLoad()
   // view.backgroundColor = .white 
}
        
    
}

struct BarInfo{
    
    var name        : String?
    var ID          : Int?
    var rating      : Float?
    var price       : String?
    var distance    : Double?
    var address     : String?
}


