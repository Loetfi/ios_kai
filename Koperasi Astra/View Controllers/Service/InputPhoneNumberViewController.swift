//
//  InputPhoneNumberViewController.swift
//  Kogoro Apps
//
//  Created by Kevin Correzian on 04/09/21.
//

import UIKit
import SkyFloatingLabelTextField

class InputPhoneNumberViewController: BaseViewController {
    
    @IBOutlet weak var cvListPulsa: UICollectionView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var tfPhone: SkyFloatingLabelTextField!
    
    var isPaketData = false
    
    var buttonList = ["50.000", "75.000", "100.000", "150.000", "200.000", "250.000"]
    var imgList =  ["Rp 50.500", "Rp 75.500", "Rp 100.500", "Rp 150.500", "Rp 200.500", "Rp 250.500"]
    
    var imgList1 =  ["Paket Bicara 550 menit & 50 menit All Operator", "Paket Combo 10GB + 100 menit + 100 SMS (on Net)", "50GB Data + 2GB OMG! (Nasional). Aktif 30 hari", "Data GameMAX. 0.5GB All Net + 2.5GB Kuota Game"]

    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupCell()
        navigationBarSetup(navBar: navigationBar, title: "Pulsa", hideBackButton: false)
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
        } else {
            let vc = StoryboardScene.Pulsa.InfoPulsaViewController.instantiate()
            vc.phoneNumber = tfPhone.text ?? ""
            vc.price = lblPrice.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension InputPhoneNumberViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isPaketData {
            return imgList1.count
        } else {
            return buttonList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulsaCell", for: indexPath) as! PulsaCollectionViewCell
        if isPaketData {
            cell.lblTitle.text = imgList1[indexPath.row]
            cell.lblTitle.font = cell.lblTitle.font.withSize(13)
        } else {
            cell.lblTitle.text = buttonList[indexPath.row]
        }
        cell.lblPrice.text = imgList[indexPath.row]
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
            self.lblPrice.text = imgList[indexPath.row]
            self.content = imgList1[indexPath.row]
        } else {
            cell.vBorder.backgroundColor = UIColor(named: "greenBlur03")
            cell.vBorder.borderColor = UIColor(named: "green03")
            self.lblPrice.text = imgList[indexPath.row]
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
