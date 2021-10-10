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
    var content = "Telkomsel"
    
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
        vc.price = price
        vc.phoneNumber = phoneNumber
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
