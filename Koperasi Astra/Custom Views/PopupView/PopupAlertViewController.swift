//
//  PopupAlertViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/10/21.
//

import UIKit

class PopupAlertViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var imgAlert: UIImageView!
    var completionHandler : ((_ vc: PopupAlertViewController) -> Void)?

    var alertError = false
    var stringError = "Terjadi kesalahan, Mohon ulangi kembali"
    var stringSuccess = "Data berhasil diubah"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if alertError {
            self.imgAlert.image = UIImage(named: "imgError")
            self.lblAlert.text = stringError
        } else {
            self.lblAlert.text = stringSuccess
        }
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
