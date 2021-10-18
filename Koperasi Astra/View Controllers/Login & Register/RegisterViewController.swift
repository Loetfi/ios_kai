//
//  RegisterViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit
import FittedSheets
import AVFoundation
//import CameraManager

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
    
    //Image
    @IBOutlet weak var imgKtp: UIImageView!
    @IBOutlet weak var imgIdCard: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var btnUpProfilePhoto: UIButton!
    @IBOutlet weak var btnUpIdCard: UIButton!
    @IBOutlet weak var btnUpKtpPhoto: UIButton!
    
    let vm = UserAuthViewModel()
    let vmMaster = MasterDataViewModel()
    var image: UIImage?
    var imageType = ""
    
    var base64Ktp = ""
    var base64Card = ""
    var base64Profile = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarSetup(navBar: navigationBar, title: "Register", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
        imgKtp.isHidden = true
        imgIdCard.isHidden = true
        imgProfile.isHidden = true
        
        getCompany()
    }
    
    func putImage(type: String) {
        guard let validImage = image else {
            return
        }
        if type == "ktp" {
            imgKtp.image = validImage
            imgKtp.isHidden = false
        } else if type == "card" {
            imgIdCard.image = validImage
            imgIdCard.isHidden = false
        } else {
            imgProfile.image = validImage
            imgProfile.isHidden = false
        }
    }
    
    func getCompany() {
        self.showLoading()
        vmMaster.getCompanyLists(
            body: ["":""],
            onSuccess: { response, message in
                self.hideLoading()
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            }
        )
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {
            picker.dismiss(animated:true, completion: nil)
            return
        }
        let base64Image = image.convertImageToBase64()
        let parseBase64 = base64Image.replacingOccurrences(of: "%", with: "")
        
        if imageType == "ktp" {
            imgKtp.image = image
            imgKtp.isHidden = false
            base64Ktp = parseBase64
        } else if imageType == "card" {
            imgIdCard.image = image
            imgIdCard.isHidden = false
            base64Card = parseBase64
        } else {
            imgProfile.image = image
            imgProfile.isHidden = false
            base64Profile = parseBase64
        }

        picker.dismiss(animated:true, completion: nil)
    }
    
    func uploadImage(imageType: String) {
        let controller = StoryboardScene.BottomSheet.CollectionListViewController.instantiate()
        
        if imageType == "ktp" {
            self.imageType = "ktp"
        } else if imageType == "card" {
            self.imageType = "card"
        } else {
            self.imageType = "profile"
        }
        
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
        if tfName.text ?? "" == "" {
            showToast(message: "Nama harus diisi")

        } else if tfEmail.text ?? "" == "" {
            showToast(message: "Email harus diisi")

        } else if tfPhoneNumber.text ?? "" == "" {
            showToast(message: "Nomor Handphone harus diisi")

        } else if tfKtpNumber.text ?? "" == "" {
            showToast(message: "Nomor KTP harus diisi")

        } else if base64Profile == "" {
            showToast(message: "Foto Profil harus diisi")

        } else if base64Ktp == "" {
            showToast(message: "Foto KTP harus diisi")

        } else if base64Card == "" {
            showToast(message: "Foto Kartu ID harus diisi")

        } else if tfNikNumber.text ?? "" == "" {
            showToast(message: "Nomor NIK harus diisi")

        } else if tfDepartment.text ?? "" == "" {
            showToast(message: "Departemen harus diisi")

        } else if tfCompanyName.text ?? "" == "" {
            showToast(message: "Nama Perusahaan harus diisi")

        } else if tfDivision.text ?? "" == "" {
            showToast(message: "Divisi Perusahaan harus diisi")

        } else if tfPosition.text ?? "" == "" {
            showToast(message: "Posisi di Perusahaan harus diisi")
        } else {
            showLoading()
                let body: [String: Any] = [
                    "name" : tfName.text ?? "",
                    "email" : tfEmail.text ?? "",
                    "phone_number" : tfPhoneNumber.text ?? "",
                    "identity_id" : tfKtpNumber.text ?? "",
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
                    let tncVC = StoryboardScene.LoginRegister.termsConditionViewController.instantiate()
                    self.navigationController?.pushViewController(tncVC, animated: true)
                }, onError: { error in
                    self.hideLoading()
                    self.showToast(message: error)
                }, onFailed: { failed in
                    self.hideLoading()
                    self.showToast(message: failed)
                }
            )
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        postRegisterUser(base64Profile: self.base64Profile, base64Company: self.base64Card, base64Identity: self.base64Ktp)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadKtpButtonAction(_ sender: Any) {
        uploadImage(imageType: "ktp")
    }
    
    @IBAction func uploadCardButtonAction(_ sender: Any) {
        uploadImage(imageType: "card")
    }
    
    @IBAction func uploadProfilePhotoButtonAction(_ sender: Any) {
        uploadImage(imageType: "profile")
    }
}

extension UIImage {
    func convertImageToBase64() -> String {
        let imageData:NSData = self.jpegData(compressionQuality: 0.4)! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        return strBase64
    }
}
