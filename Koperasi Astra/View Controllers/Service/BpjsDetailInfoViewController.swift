//
//  BpjsDetailInfoViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class BpjsDetailInfoViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "BPJS", hideBackButton: false)
    }
    
    @IBAction func paymentButtonTap(_ sender: Any) {
        let vc = StoryboardScene.Pulsa.PaymentOptionPulsaViewController.instantiate()
        vc.price = "Rp 614.500"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
