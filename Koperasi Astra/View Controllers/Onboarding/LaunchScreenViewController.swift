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
            checkSessionToken()
        }
    }
    
    func checkSessionToken() {
        let token = UserDefaults().string(forKey: "userToken") ?? ""
        if !token.isEmpty {
            goToHome()
        } else {
            if isAppAlreadyLaunchedOnce() == true {
                goToLogin()
            } else {
                goToOnboarding()
            }
        }
    }
    
    func goToOnboarding() {
        let vc = StoryboardScene.Onboarding.OnboardingViewController.instantiate()
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}
