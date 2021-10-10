//
//  LoanDataViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 04/10/21.
//

import UIKit

class LoanDataViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Ajukan Pinjaman", hideBackButton: false)
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        let vc = StoryboardScene.Loan.LoanFinishViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
