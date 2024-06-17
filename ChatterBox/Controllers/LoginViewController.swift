//
//  LoginRegisterViewController.swift
//  ChatterBox
//
//  Created by Gautham C on 6/13/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.loginName
    }
    
    @IBAction func onLoginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                   Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                       if let e = error {
                           print(e.localizedDescription)
                       } else {
                           self.performSegue(withIdentifier: Constants.Segue.loginToChat, sender: self)
                       }
                       
                     
                   }
               }
    }

}
