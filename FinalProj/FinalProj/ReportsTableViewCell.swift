//
//  ReportsTableViewCell.swift
//  FinalProj
//
//  Created by Andre Vincent on 5/6/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit

class ReportsTableViewCell: UITableViewCell {

    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var userComments: UILabel!
    @IBOutlet weak var userRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
