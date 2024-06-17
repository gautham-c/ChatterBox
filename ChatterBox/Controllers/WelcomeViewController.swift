//
//  ViewController.swift
//  ChatterBox
//
//  Created by Gautham C on 6/13/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    
    let appName = Constants.appName
    var characterCount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.text = ""
        for letter in appName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterCount, repeats: false) { timer in
                self.appNameLabel.text?.append(letter)
            }
            characterCount += 1
        }
    }


}

