//
//  PersonalDataViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class PersonalDataViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Data Personal"
        navBar.isLeftButtonHidden = false
    }
}
