//
//  AuthenticationViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 4/11/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
    }
    @IBAction func enterWithoutAuth(_ sender: Any) {
        PFAnonymousUtils.logIn {
            (user, error)  in
            if error != nil || user == nil {
                print("Anonymous login failed.")
            } else {
                print("Anonymous user logged in.")
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
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
