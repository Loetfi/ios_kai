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
    @IBOutlet weak var btnEyePassword: UIButton!
    
    let vm = UserAuthViewModel()
    var eyePasswordState = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        constraint = bottomConstraint
        fixKeyboardScroll()
        swipeBackEnabled = false
    }
    
    func postLoginUser() {
        showLoading()
        let body: [String: Any] = [
            "username" : tfIDNumber.text ?? "",
            "password" : tfPassword.text ?? ""
        ]
        vm.postLogin(
            body: body, onSuccess: { response,message in
                self.hideLoading()
                let defaults = UserDefaults.standard
                defaults.set(response.token, forKey: "authToken")
                defaults.set(response.isNewUser, forKey: "isNewUser")
                defaults.set(response.idRoleMaster, forKey: "idRoleMaster")
                self.goToHome()
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            })
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.forgotPasswordViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        postLoginUser()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.registerViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnEyeTap(_ sender: Any) {
        if eyePasswordState == true {
            tfPassword.isSecureTextEntry = false
            tfPassword.togglePasswordVisibility()
            if #available(iOS 13.0, *) {
                btnEyePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
        } else {
            tfPassword.isSecureTextEntry = true
            tfPassword.togglePasswordVisibility()
            if #available(iOS 13.0, *) {
                btnEyePassword.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
        eyePasswordState = !eyePasswordState
    }
}
