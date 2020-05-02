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
import TinyConstraints

class ReportViewController: UIViewController {
    
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var questionField: UILabel!
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        return view
    }()
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        view.addSubview(cosmosView)
     
        cosmosView.centerInSuperview()
}
}

