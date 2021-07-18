//
//  TermsConditionsViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class TermsConditionsViewController: BaseViewController {
    
    @IBOutlet weak var btnChecklist: UIButton!
    @IBOutlet weak var topNavigationBar: NavigationBar!
    
    var switchFlag: Bool = false {
        didSet{
            if switchFlag {
                btnChecklist.layer.borderWidth = 0.5
                btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist.tintColor = UIColor(named: "green03")
            } else {
                btnChecklist.layer.borderWidth = 0.5
                btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist.tintColor = UIColor.white
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: topNavigationBar, title: "Register", hideBackButton: false)
        
        btnChecklist.layer.borderWidth = 0.5
        btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
        btnChecklist.tintColor = UIColor.white
    }
    
    @IBAction func checklistButtonAction(_ sender: Any) {
        if switchFlag {
            switchFlag = false
        } else {
            switchFlag = true
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if switchFlag {
            let vc = StoryboardScene.LoginRegister.otpViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            showToast(message: "Mohon klik checkbox syarat dan ketentuan")
        }
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
