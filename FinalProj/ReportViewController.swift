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
        
        view.settings.filledImage = UIImage(named: "RatingStarFilled")?.withRenderingMode(.alwaysOriginal)
        view.settings.emptyImage = UIImage(named: "RatingStarEmpty")?.withRenderingMode(.alwaysOriginal)
        
        view.settings.totalStars = 5
        view.settings.starSize = 17
        view.settings.starMargin = 3.3
        view.settings.fillMode = .full
        view.text = "Rating"
        view.settings.textColor = .red
        view.settings.textMargin = 10
        
        
        return view
    }()
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        view.addSubview(cosmosView)
     
        cosmosView.centerInSuperview()
        
        cosmosView.didTouchCosmos = {rating in
            print("Rated: \(rating)")
        }
}
}

