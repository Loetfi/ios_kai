//
//  InfoPulsaViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class InfoPulsaViewController: BaseViewController {

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPaketName: UILabel!
    @IBOutlet weak var navigationBar: NavigationBar!

    var phoneNumber = ""
    var price = ""
    var content = ""
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        lblPrice.text = price
        lblPhone.text = phoneNumber
        lblPaketName.text = content
        navigationBarSetup(navBar: navigationBar, title: "Pulsa", hideBackButton: false)
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        let vc = StoryboardScene.Pulsa.PaymentOptionPulsaViewController.instantiate()
        //dataAvailable
        vc.price = price
        vc.phoneNumber = phoneNumber
        vc.billerId = billerId //billersIdPulsa / paketData
        vc.productId = productId //masterProfiderphoneid
        vc.productImagePath = productImagePath
        vc.productName = productName // providerPhoneCode
        vc.systrace = systrace
        vc.billId = billId
        vc.inquiryId = inquiryId
        vc.billerName = billerName // title
        vc.productDetails = productDetails //billername

        vc.billerTrx = billerTrx //default 1
        vc.categoryId = categoryId //default CATBILLER
        vc.idChannel = idChannel //default CHN0001
        vc.quantity = quantity //default 1
        vc.idDeliveryType = idDeliveryType//default DLV001
        vc.idUserCompany = idUserCompany //default 71
        vc.idWorkflowStatus = idWorkflowStatus //default DLV001
        vc.nameDeliveryType = nameDeliveryType //default Direct
        vc.idPaymentType = idPaymentType // default PAY003
        vc.identifierNumber = identifierNumber //default 11
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

/*
 "cart": [
     {
       "account_number": "085883515748",
       "additional_data_1": "Oke",
       "additional_data_2": "Oke",
       "additional_data_3": "Oke",
       "base_price": "49850.00",
       "bill_id": "7",
       "biller_id": "9900007",
       "biller_name": "INDOSAT 50rb - 49.850",
       "billertrx": 1,
       "category_id": "CATBILLER",
       "id_channel": "CHN0001",
       "inquiry_id": "37691790",
       "product_details": "PULSA INDOSAT",
       "product_id": 11,
       "product_image_path": "http://1.bp.blogspot.com/-aayixrYWVHU/Vv3gPeQ8IMI/AAAAAAAAD3E/LObcRoujgJA-SgvHJhzXZig8EEvzVU5Yw/s1600/Indosat%2BOoredoo%2BVector%2BLogo.png",
       "product_name": "Mentari",
       "quantity": 1,
       "sell_price": 49850,
       "systrace": 1634805668,
       "totalPayment": 49850
     }
   ],
   "id_delivery_type": "DLV001",
   "id_user_company": 71,
   "id_workflow_status": "ODSTS01",
   "name_delivery_type": "Direct",
   "payment": [
     {
       "id_payment_type": "PAY003",
       "identifier_number": 11,
       "total_payment": "49850"
     }
   ],
   "total_billing": 49850
 */
