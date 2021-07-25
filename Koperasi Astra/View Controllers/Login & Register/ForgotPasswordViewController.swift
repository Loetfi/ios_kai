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
    
    @IBOutlet weak var tfNik: UITextField!
    @IBOutlet weak var svCheckSms: UIStackView!
    @IBOutlet weak var svTextfield: UIStackView!
    @IBOutlet weak var btnSubmit: ButtonTemplate!
    
    let vm = UserAuthViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetup(navBar: navBar, title: "Lupa Password", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
    }
    
    func apiForgotPassword(nik: String) {
        showLoading()
        vm.postForgotPassword(
        body: ["nik":nik],
        onSuccess: { response,message in
            self.hideLoading()
            self.showToast(message: message)
            self.btnSubmit.setTitle("Kembali Login", for: .normal)
            self.svCheckSms.isHidden = false
            self.svTextfield.isHidden = true },
        onError: { error in
            self.hideLoading()
            self.showToast(message: error) },
        onFailed: { failed in
            self.hideLoading()
            self.showToast(message: failed) }
        )
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        if btnSubmit.title(for: .normal) == "Kembali Login"{
            goToLogin()
        } else {
            self.apiForgotPassword(nik: tfNik.text ?? "")
        }
    }
    
}
