//
//  PopupSelectionViewController.swift
//  Kogoro Apps
//
//  Created by Kevin Correzian on 08/09/21.
//

import UIKit

class PopupSelectionViewController: UIViewController {

    var completionHandler : ((_ vc: PopupSelectionViewController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func yesButtonTap(_ sender: Any) {
        self.completionHandler?(self)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
