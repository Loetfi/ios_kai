//
//  RegisterViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit
import FittedSheets

class RegisterViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
    
    @IBOutlet weak var btnUpProfilePhoto: UIButton!
    @IBOutlet weak var btnUpIdCard: UIButton!
    @IBOutlet weak var btnUpKtpPhoto: UIButton!
    
    let vm = UserAuthViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetup(navBar: navigationBar, title: "Register", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func uploadImage() {
        let controller = StoryboardScene.BottomSheet.CollectionListViewController.instantiate()
        
        let completionHandler:(CollectionListViewController) -> Void = { vc in
            self.dismiss(animated: true, completion: nil)
            if vc.type == "camera" {
                self.openCamera()
            } else if vc.type == "scan" {
                self.openGallery()
            }
            
        }
        controller.completionHandler = completionHandler
        
        let sheetHeight = 180
        var sheetSizes: [SheetSize]
        if sheetHeight < Int((UIScreen.main.bounds.height) / 2) {
            sheetSizes = [SheetSize.fixed(CGFloat(sheetHeight))]
        } else {
            sheetSizes = [SheetSize.percent(50), SheetSize.fullscreen]
        }
        let sheetController = SheetViewController(controller: controller, sizes: sheetSizes)
        sheetController.gripColor = UIColor.white.withAlphaComponent(0.5)
        sheetController.cornerRadius = 15
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func postRegisterUser(base64Profile: String, base64Company: String, base64Identity: String) {
        showLoading()
        
        let body: [String: Any] = [
            "name" : tfName.text ?? "",
            "email" : tfEmail.text ?? "",
            "phone_number" : tfPhoneNumber.text ?? "",
            "identity_id" : tfCardId.text ?? "",
            "identity_photo" : base64Identity,
            "nik" : tfNikNumber.text ?? "",
            "department" : tfDepartment.text ?? "",
            "company" : tfCompanyName.text ?? "",
            "division" : tfDivision.text ?? "",
            "position" : tfPosition.text ?? "",
            "company_identity_photo" : base64Company,
            "personal_photo" : base64Profile
        ]
        vm.postRegister(
            body: body, onSuccess: { response, message in
                self.hideLoading()
                let defaults = UserDefaults.standard
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
        uploadImage()
    }
    
    @IBAction func uploadCardButtonAction(_ sender: Any) {
        uploadImage()
    }
    
    @IBAction func uploadProfilePhotoButtonAction(_ sender: Any) {
        uploadImage()
    }
}
