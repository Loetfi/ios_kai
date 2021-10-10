//
//  DetailLoanViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 04/10/21.
//

import UIKit

class DetailLoanViewController: BaseViewController {
    
    var completionHandler : ((_ vc: DetailLoanViewController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func closeButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButtonTap(_ sender: Any) {
        self.completionHandler?(self)
        self.dismiss(animated: true, completion: nil)
    }
}
