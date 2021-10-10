//
//  BpjsViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 03/10/21.
//

import UIKit

class BpjsViewController: BaseViewController {

    @IBOutlet weak var vTagihan: UIStackView!
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "BPJS", hideBackButton: false)
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        let vc = StoryboardScene.Bpjs.BpjsDetailInfoViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func cekTagihanButtonTap(_ sender: Any) {
        if vTagihan.isHidden {
            vTagihan.isHidden = false
        } else {
            vTagihan.isHidden = true
        }
    }
}
