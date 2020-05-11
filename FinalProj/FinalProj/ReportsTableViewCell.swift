//
//  ReportsTableViewCell.swift
//  FinalProj
//
//  Created by Andre Vincent on 5/6/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Cosmos

class ReportsTableViewCell: UITableViewCell {

    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var userComments: UILabel!
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Ratings should not be changed when the 
        starRating.settings.updateOnTouch = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
