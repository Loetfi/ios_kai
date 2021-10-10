//
//  PaymentSaldoViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class PaymentSaldoViewController: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var lblTotalBelanja: UILabel!
    @IBOutlet weak var lblSisaSaldo: UILabel!
    @IBOutlet weak var lblTotalTransaksi: UILabel!
    
    var phoneNumber = ""
    var price = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navigationBar, title: "Pembayaran Saldo", hideBackButton: false)
        self.lblTotalTransaksi.text = price
    }
}
