//
//  LoginViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var tfIDNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        constraint = bottomConstraint
        fixKeyboardScroll()
        swipeBackEnabled = false
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.forgotPasswordViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        goToHome()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.registerViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
