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
    let vmBiller = BillerViewModel()

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
    
    var billId = ""
    var billerId = ""
    var billerName = ""
    var billerTrx = 0
    var categoryId = ""
    var idChannel = ""
    var inquiryId = ""
    var productDetails = ""
    var productId = 0
    var productImagePath = ""
    var productName = ""
    var quantity = 0
    var sellPrice = 0
    var systrace = 0
    var idDeliveryType = ""
    var idUserCompany = 0
    var idWorkflowStatus = ""
    var nameDeliveryType = ""
    var idPaymentType = ""
    var identifierNumber = 0
    
    func postBillerVa() {
        self.showLoading()
        let parse = price.replacingOccurrences(of: ".00", with: "")
        let totalPayment = parse.replacingOccurrences(of: "Rp ", with: "")
//        let payment = "payment": ["id_payment_type" :"PAY003",
//                                   "identifier_number": 11,
//                                   "total_payment": "\(totalPayment)"]
//        ]
        let body = [
            "cart": [[
                  "account_number" : phoneNumber,
                  "additional_data_1" : "Oke",
                  "additional_data_2" : "Oke",
                  "additional_data_3" : "Oke",
                  "base_price" : "\(totalPayment).00",
                  "bill_id" : billId,
                  "biller_id" : billerId,
                  "biller_name" : billerName,
                  "billertrx": 1,
                  "category_id": "CATBILLER",
                  "id_channel": "CHN0001",
                  "inquiry_id": inquiryId,
                  "product_details": productDetails,
                  "product_id": productId,
                  "product_image_path": productImagePath,
                  "product_name": productName,
                  "quantity": 1,
                  "sell_price": Int(totalPayment) ?? 0,
                  "systrace": systrace,
                  "totalPayment": Int(totalPayment) ?? 0
              ]],
              "id_delivery_type": "DLV001",
              "id_user_company": 71,
              "id_workflow_status": "ODSTS01",
              "name_delivery_type": "Direct",
            "payment": [[
                  "id_payment_type" :"PAY003",
                  "identifier_number": 11,
                  "total_payment": "\(totalPayment)"
              ]],
            "total_billing": Int(totalPayment) ?? 0
        ] as [String : Any]
        vmBiller.postOrderBiller(
            body: body,
            onSuccess: { response,message in
                self.hideLoading()
                if self.switchFlag {
                    let vc = StoryboardScene.Pulsa.PaymentSaldoViewController.instantiate()
                    vc.price = self.price
                    vc.phoneNumber = self.phoneNumber
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let vc = StoryboardScene.Pulsa.PaymentVaViewController.instantiate()
                    vc.price = self.price
                    vc.phoneNumber = self.phoneNumber
                    vc.vaNumber = response.vaNumber ?? ""
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            }
        )
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
        if self.switchFlag {
            self.showToast(message: "Fitur ini belum tersedia")
//            let vc = StoryboardScene.Pulsa.PaymentSaldoViewController.instantiate()
//            vc.price = self.price
//            vc.phoneNumber = self.phoneNumber
//            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            postBillerVa()
        }
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
