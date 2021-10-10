//
//  AirViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class AirViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var vAetra: UIView!
    @IBOutlet weak var vPalyja: UIView!
    @IBOutlet weak var btnAetra: UIButton!
    @IBOutlet weak var btnPalyja: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Tagihan Air", hideBackButton: false)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
