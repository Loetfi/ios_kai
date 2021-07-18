//
//  ForgotPasswordViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: NavigationBar!
    
    @IBOutlet weak var svCheckSms: UIStackView!
    @IBOutlet weak var svTextfield: UIStackView!
    @IBOutlet weak var btnSubmit: ButtonTemplate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetup(navBar: navBar, title: "Lupa Password", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        if btnSubmit.title(for: .normal) == "Kembali Login"{
            goToLogin()
        } else {
            btnSubmit.setTitle("Kembali Login", for: .normal)
            svCheckSms.isHidden = false
            svTextfield.isHidden = true
        }
    }
    
}
