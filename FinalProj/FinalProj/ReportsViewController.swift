//
//  ReportsViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 5/5/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse
class ReportsViewController: UIViewController {

    @IBOutlet weak var barName: UITextField!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var ratingField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let submissions = PFObject(className: "submissions")
        submissions["barName"] = barName.text
        submissions["comments"] = commentField.text
        submissions["rating"] = ratingField.text
        submissions.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print("error")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
