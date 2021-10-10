//
//  ListrikViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class ListrikViewController: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var vAetra: UIView!
    @IBOutlet weak var vPalyja: UIView!
    @IBOutlet weak var btnAetra: UIButton!
    @IBOutlet weak var btnPalyja: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navigationBar, title: "Listrik PLN", hideBackButton: false)
    }
    
    @IBAction func aetraButtonTap(_ sender: Any) {
        if vAetra.isHidden {
            vAetra.isHidden = false
            vPalyja.isHidden = true
            btnAetra.setTitleColor(UIColor(named: "green01"), for: .normal)
            btnPalyja.setTitleColor(UIColor(named: "black01"), for: .normal)
        }
    }
    @IBAction func palyjaButtonTap(_ sender: Any) {
        if vPalyja.isHidden {
            vAetra.isHidden = true
            vPalyja.isHidden = false
            btnPalyja.setTitleColor(UIColor(named: "green01"), for: .normal)
            btnAetra.setTitleColor(UIColor(named: "black01"), for: .normal)
        }
    }
}
