//
//  LaunchScreenViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class LaunchScreenViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkConnection()
    }
    
    func checkConnection() {
        if checkInternetConnection() == true {
            goToOnboarding()
        } else {
            
        }
    }
    
    func goToOnboarding() {
        let vc = StoryboardScene.Onboarding.OnboardingViewController.instantiate()
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}
