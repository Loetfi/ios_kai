//
//  RegisterViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfKtpNumber: UITextField!
    @IBOutlet weak var tfUploadKTP: UITextField!
    @IBOutlet weak var tfNikNumber: UITextField!
    @IBOutlet weak var tfCompanyName: UITextField!
    @IBOutlet weak var tfDepartment: UITextField!
    @IBOutlet weak var tfDivision: UITextField!
    @IBOutlet weak var tfPosition: UITextField!
    @IBOutlet weak var tfCardId: UITextField!
    @IBOutlet weak var tfProfilePhoto: UITextField!
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetup(navBar: navigationBar, title: "Register", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
    }
    
    func postRegisterUser() {
        showLoading()
        let body: [String: Any] = [
            "name" : tfName.text,
            "email" : tfEmail.text,
            "phone_number" : tfPhoneNumber.text,
            "identity_id" : tfCardId.text,
            "identity_photo" : .text,
            "nik" : tfNikNumber.text,
            "department" : tfDepartment.text,
            "company" : tfCompanyName.text,
            "division" : tfDivision.text,
            "position" : tfPosition.text,
            "company_identity_photo" : tfcom.text,
            "personal_photo" : tfIDNumber.text
        ]
        vm.postLogin(
            body: body, onSuccess: { response in
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
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let tncVC = StoryboardScene.LoginRegister.termsConditionViewController.instantiate()
        self.navigationController?.pushViewController(tncVC, animated: true)
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func uploadKtpButtonAction(_ sender: Any) {
    }
    @IBAction func uploadCardButtonAction(_ sender: Any) {
    }
    @IBAction func uploadProfilePhotoButtonAction(_ sender: Any) {
    }
}
