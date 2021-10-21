//
//  PaymentVaViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class PaymentVaViewController: BaseViewController {
    
    @IBOutlet weak var vTotalPembayaran: UIView!
    @IBOutlet weak var vMobileInternet: UIView!
    @IBOutlet weak var vPermata: UIView!
    @IBOutlet weak var vAtmBersama: UIView!
    
    @IBOutlet weak var vTitleAtmBersama: UIView!
    @IBOutlet weak var vTitlePermata: UIView!
    @IBOutlet weak var vTitleMobileInternet: UIView!
    @IBOutlet weak var vTitleTotalPembayaran: UIView!
    @IBOutlet weak var navigationBar: NavigationBar!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblVaNumber: UILabel!
    @IBOutlet weak var lblBankProvider: UILabel!
    
    var phoneNumber = ""
    var price = ""
    var vaNumber = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblVaNumber.text = vaNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navigationBar, title: "Pembayaran VA", hideBackButton: false)
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction1))
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))

        self.vTitleTotalPembayaran.addGestureRecognizer(gesture)
        self.vTitleMobileInternet.addGestureRecognizer(gesture1)
        self.vTitlePermata.addGestureRecognizer(gesture2)
        self.vTitleAtmBersama.addGestureRecognizer(gesture3)
        
        lblPrice.text = price
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        if vTotalPembayaran.isHidden {
            vTotalPembayaran.isHidden = false
        } else {
            vTotalPembayaran.isHidden = true
        }
    }
    @objc func checkAction1(sender : UITapGestureRecognizer) {
        if vMobileInternet.isHidden {
            vMobileInternet.isHidden = false
        } else {
            vMobileInternet.isHidden = true
        }
        
    }
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        if vPermata.isHidden {
            vPermata.isHidden = false
        } else {
            vPermata.isHidden = true
        }
    }
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        if vAtmBersama.isHidden {
            vAtmBersama.isHidden = false
        } else {
            vAtmBersama.isHidden = true
        }
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        goToHome()
    }
}
