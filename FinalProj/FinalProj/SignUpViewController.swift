//
//  SignUpViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 4/11/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailInputField: UITextField!
    @IBOutlet weak var usernameInputField: UITextField!
    @IBOutlet weak var passwordInputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameInputField.text
        user.password = passwordInputField.text
        user.email = emailInputField.text
        user["firstName"] = firstNameField.text
        user["lastName"] = lastNameField.text
        
        
        user.signUpInBackground { (success, fail) in
            if success {
                self.performSegue(withIdentifier: "EnterSegue", sender: nil)
            }
            else {
                print("Error: \(fail?.localizedDescription)")
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
