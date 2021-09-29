//
//  AboutUsViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class AboutUsViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Tentang Koperasi", hideBackButton: false)
    }
}
