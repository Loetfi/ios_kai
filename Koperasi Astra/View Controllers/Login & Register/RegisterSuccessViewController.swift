//
//  RegisterSuccessViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/07/21.
//

import UIKit

class RegisterSuccessViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Register Success", hideBackButton: false)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        goToHome()
    }
}
