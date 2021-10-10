//
//  AboutAppsViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 04/10/21.
//

import UIKit

class AboutAppsViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Tentang Aplikasi", hideBackButton: false)
    }
}
