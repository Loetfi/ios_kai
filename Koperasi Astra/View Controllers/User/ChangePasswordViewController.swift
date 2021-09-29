//
//  ChangePasswordViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    
    @IBOutlet weak var navBar: NavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Ubah Kata Sandi", hideBackButton: false)
    }
}
