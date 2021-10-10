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
//    @IBOutlet weak var vNonBunga: CardView!
//    @IBOutlet weak var vPinjamanBarang: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
//        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction1))
//
//        self.vNonBunga.addGestureRecognizer(gesture)
//        self.vPinjamanBarang.addGestureRecognizer(gesture1)
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let vc = StoryboardScene.Loan.ApplyLoanViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func checkAction1(sender : UITapGestureRecognizer) {
        let vc = StoryboardScene.Loan.ApplyLoanViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        navBar.title = "Pinjaman"
        navBar.isLeftButtonHidden = true
    }
}
