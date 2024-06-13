//
//  RegisterViewController.swift
//  ChatterBox
//
//  Created by Gautham C on 6/13/24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        if let email = emailLabel.text, let password = passwordLabel.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: "LoginToChat", sender: self)
                        }
                    }
                }
    }

}
