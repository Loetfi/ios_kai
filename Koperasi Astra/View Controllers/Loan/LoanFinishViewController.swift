//
//  LoanFinishViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 04/10/21.
//

import UIKit

class LoanFinishViewController: BaseViewController {

    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lblTitle4: UILabel!
    @IBOutlet weak var v34: UIView!
    @IBOutlet weak var v4: CardView!
    
    @IBOutlet weak var vFinish: UIStackView!
    @IBOutlet weak var vTerms: UIStackView!
    @IBOutlet weak var btnNext: ButtonTemplate!
    @IBOutlet weak var navBar: NavigationBar!
    
    @IBOutlet weak var btnChecklist: UIButton!
    
    var switchFlag: Bool = false {
        didSet{
            if switchFlag {
                btnChecklist.layer.borderWidth = 0.5
                btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist.tintColor = UIColor(named: "green01")
            } else {
                btnChecklist.layer.borderWidth = 0.5
                btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
                btnChecklist.tintColor = UIColor.white
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Ajukan Pinjaman", hideBackButton: false)
        
        btnChecklist.layer.borderWidth = 0.5
        btnChecklist.layer.borderColor = UIColor(named: "black02")?.cgColor
        btnChecklist.tintColor = UIColor.white
    }
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if btnNext.title(for: .normal) == "Lanjutkan" {
            if switchFlag {
                vFinish.isHidden = false
                vTerms.isHidden = true
                self.btnNext.setTitle("Kembali ke Home", for: .normal)
                self.v34.backgroundColor = UIColor(named: "orange02")
                self.v4.borderColor = UIColor(named: "orange02")
                self.v4.backgroundColor = UIColor(named: "orange01")
                self.lbl4.textColor = UIColor(named: "orange02")
                self.lblTitle4.textColor = UIColor(named: "orange02")
            } else {
                showToast(message: "Mohon klik checkbox syarat dan ketentuan")
            }
        } else {
            goToHome()
        }
    }
    
    @IBAction func checklistButtonTap(_ sender: Any) {
        if switchFlag {
            switchFlag = false
        } else {
            switchFlag = true
        }
    }
}
