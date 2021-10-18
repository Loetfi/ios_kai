//
//  PaymentOptionPulsaViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class PaymentOptionPulsaViewController: BaseViewController {
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnChecklist1: UIButton!
    @IBOutlet weak var btnChecklist2: UIButton!
    @IBOutlet weak var navigationBar: NavigationBar!
    
    var phoneNumber = ""
    var price = ""
    let vmLoan = LoanViewModel()
    
    var switchFlag: Bool = false {
        didSet{
            if switchFlag {
                btnChecklist1.layer.borderWidth = 0.5
                btnChecklist1.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist1.tintColor = UIColor(named: "green01")
            } else {
                btnChecklist1.layer.borderWidth = 0.5
                btnChecklist1.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist1.tintColor = UIColor.white
            }
        }
    }
    
    var switchFlag2: Bool = false {
        didSet{
            if switchFlag2 {
                btnChecklist2.layer.borderWidth = 0.5
                btnChecklist2.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist2.tintColor = UIColor(named: "green01")
            } else {
                btnChecklist2.layer.borderWidth = 0.5
                btnChecklist2.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist2.tintColor = UIColor.white
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblPrice.text = price
        navigationBarSetup(navBar: navigationBar, title: "Pembayaran", hideBackButton: false)
        btnChecklist1.layer.cornerRadius = 11
        btnChecklist2.layer.cornerRadius = 11
        btnChecklist2.layer.borderWidth = 0.5
        btnChecklist1.layer.borderWidth = 0.5
        btnChecklist1.layer.borderColor = UIColor(named: "black02")?.cgColor
        btnChecklist2.layer.borderColor = UIColor(named: "black02")?.cgColor
    }
    
    func billerVa(type: String) {
        switch type {
        case "va" :
            validateVoucher(type: type, code: "PAY003")
            break
        case "middleloan" :
            validateVoucher(type: type, code: "PAY003")
            break
        case "microloan" :
            validateVoucher(type: type, code: "MicroloanPayment")
            break
        case "split" :
            validateVoucher(type: type, code: "PAY003")
            break
        default:
            break
        }
    }
    
    func validateVoucher(type: String, code: String) {
        self.showLoading()
        vmLoan.getVoucherValidate(
            type: type,
            code: code,
            onSuccess: { response,message in
                self.hideLoading()
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            })
    }
    
    @IBAction func checklistButtonAction1(_ sender: Any) {
        if switchFlag {
            switchFlag = false
            switchFlag2 = true
        } else {
            switchFlag = true
            switchFlag2 = false
        }
    }
    
    @IBAction func checklistButtonAction2(_ sender: Any) {
        if switchFlag2 {
            switchFlag2 = false
            switchFlag = true
        } else {
            switchFlag2 = true
            switchFlag = false
        }
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if switchFlag {
            let vc = StoryboardScene.Pulsa.PaymentSaldoViewController.instantiate()
            vc.price = price
            vc.phoneNumber = phoneNumber
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = StoryboardScene.Pulsa.PaymentVaViewController.instantiate()
            vc.price = price
            vc.phoneNumber = phoneNumber
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
