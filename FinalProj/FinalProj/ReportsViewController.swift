//
//  ReportsViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 5/5/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse
import Cosmos

class ReportsViewController: UIViewController {

    @IBOutlet weak var barName: UITextField!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var ratingField: UITextField!
    @IBOutlet weak var starRating: CosmosView!
    let submissions = PFObject(className: "submissions")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(starRating)
        starRating.didFinishTouchingCosmos = { rating in
            self.submissions["starRating"] = rating
            print(rating)
        }
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        self.submissions["barName"] = barName.text
        self.submissions["comments"] = commentField.text
        self.submissions["rating"] = ratingField.text
        
        self.submissions.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("error")
            }
        }
    }

}
