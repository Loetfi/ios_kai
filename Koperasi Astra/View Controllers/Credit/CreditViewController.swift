//
//  CreditViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/07/21.
//

import UIKit

class CreditViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var userMenuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBar.title = "Credit"
        navBar.isLeftButtonHidden = true
    }
}
