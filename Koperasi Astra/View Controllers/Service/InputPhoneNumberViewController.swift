//
//  InputPhoneNumberViewController.swift
//  Kogoro Apps
//
//  Created by Kevin Correzian on 04/09/21.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire

class InputPhoneNumberViewController: BaseViewController {
    
    @IBOutlet weak var cvListPulsa: UICollectionView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var tfPhone: SkyFloatingLabelTextField!
    @IBOutlet weak var ivOperator: UIImageView!
    @IBOutlet weak var lblOperator: UILabel!
    
    var isPaketData = false
    
    var buttonList = ["50.000", "75.000", "100.000", "150.000", "200.000", "250.000"]
    var imgList =  ["Rp 50.500", "Rp 75.500", "Rp 100.500", "Rp 150.500", "Rp 200.500", "Rp 250.500"]
    
    var imgList1 =  ["Paket Bicara 550 menit & 50 menit All Operator", "Paket Combo 10GB + 100 menit + 100 SMS (on Net)", "50GB Data + 2GB OMG! (Nasional). Aktif 30 hari", "Data GameMAX. 0.5GB All Net + 2.5GB Kuota Game"]

    var content = ""
    let vmBiller = BillerViewModel()
    var billDetails: [BillDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfPhone.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupCell()
        navigationBarSetup(navBar: navigationBar, title: "Pulsa", hideBackButton: false)
    }
    
    func getPhoneOperator(phoneCode: String) {
        self.showLoading()
        vmBiller.getCheckPhone(
            phoneCode: phoneCode,
            onSuccess: { response,message in
                for item in response {
                    self.ivOperator.loadImage(url: item.providerPhoneImage ?? "", into: self.ivOperator)
                    self.lblOperator.text = "\(item.providerPhoneCode ?? "".uppercased()) \(item.providerPhoneName ?? "")"
                    if self.isPaketData {
                        self.postPulsaDetails(billerId: item.billersIdPaketdata ?? "", accountNumber: self.tfPhone.text ?? "")
                    } else {
                        self.postPulsaDetails(billerId: item.billersIdPulsa ?? "", accountNumber: self.tfPhone.text ?? "")
                    }
                }
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
    
    func postPulsaDetails(billerId: String, accountNumber: String) {
        self.showLoading()
        vmBiller.postPulsaList(
            billerId: billerId,accountNumber: accountNumber,
            onSuccess: { response,message in
                self.hideLoading()
                self.billDetails.removeAll()
                self.billDetails.append(contentsOf: response.response?.billDetails ?? [])
                self.cvListPulsa.reloadData()
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            }
        )
    }
    
    func setupCell(){
        cvListPulsa.delegate = self
        cvListPulsa.dataSource = self
        tfPhone.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        let nibCollection = UINib(nibName: "PulsaCollectionViewCell", bundle: nil)
        cvListPulsa.register(nibCollection, forCellWithReuseIdentifier: "PulsaCell")
        cvListPulsa.allowsSelection = true
        cvListPulsa.contentInsetAdjustmentBehavior = .always
        cvListPulsa.allowsMultipleSelection = false
        
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = tfPhone {
                if text.count < 1 {
                    floatingLabelTextField.errorMessage = "Mohon Masukkan Nomor Telepon"
                }
                else {
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if tfPhone.text == "" {
            tfPhone.errorMessage = "Mohon Masukkan Nomor Telepon"
        } else if content == "" {
            self.showToast(message: "Mohon pilih paket yang ingin dibeli")
        } else {
            let vc = StoryboardScene.Pulsa.InfoPulsaViewController.instantiate()
            vc.phoneNumber = tfPhone.text ?? ""
            vc.price = lblPrice.text ?? ""
            vc.content = content
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension InputPhoneNumberViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return billDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulsaCell", for: indexPath) as! PulsaCollectionViewCell
        if isPaketData {
            cell.lblTitle.text = billDetails[indexPath.row].title
            cell.lblTitle.font = cell.lblTitle.font.withSize(13)
        } else {
            cell.lblTitle.text = billDetails[indexPath.row].title
        }
        cell.lblPrice.text = billDetails[indexPath.row].totalAmount
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isPaketData {
            return CGSize(width: cvListPulsa.frame.width - 10, height: 80)
        } else {
            return CGSize(width: cvListPulsa.frame.width / 2 - 10, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PulsaCollectionViewCell
        if isPaketData {
            cell.vBorder.backgroundColor = UIColor(named: "greenBlur03")
            cell.vBorder.borderColor = UIColor(named: "green03")
            self.lblPrice.text = "Rp \(billDetails[indexPath.row].totalAmount ?? "")"
            self.content = billDetails[indexPath.row].title ?? ""
        } else {
            cell.vBorder.backgroundColor = UIColor(named: "greenBlur03")
            cell.vBorder.borderColor = UIColor(named: "green03")
            self.lblPrice.text = "Rp \(billDetails[indexPath.row].totalAmount ?? "")"
            self.content = billDetails[indexPath.row].title ?? ""
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PulsaCollectionViewCell
        if isPaketData {
            cell.vBorder.backgroundColor = UIColor.white
            cell.vBorder.borderColor = UIColor(named: "black04")
        } else {
            cell.vBorder.backgroundColor = UIColor.white
            cell.vBorder.borderColor = UIColor(named: "black04")
        }
    }
}

extension InputPhoneNumberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text?.count ?? 0 >= 7 {
            let phoneDigit = textField.text?.prefix(4)
            performAction(phone: "\(phoneDigit ?? "")")
            return true
        } else {
            showToast(message: "phone number minimal 7 digit")
            return false
        }
        
    }

    func performAction(phone:String) {
        self.getPhoneOperator(phoneCode: phone)
    }
}
