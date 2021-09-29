//
//  AddressSetupViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class AddressSetupViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var cvList: UICollectionView!
    
    var buttonList = ["50.000", "75.000"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navBar, title: "Alamat", hideBackButton: false)
        setupCell()
    }
    
    func setupCell(){
        cvList.delegate = self
        cvList.dataSource = self
        let nibCollection = UINib(nibName: "AddressCollectionViewCell", bundle: nil)
        cvList.register(nibCollection, forCellWithReuseIdentifier: "PulsaCell")
        cvList.allowsSelection = true
        cvList.contentInsetAdjustmentBehavior = .always
        cvList.allowsMultipleSelection = false
    }
    
}

extension AddressSetupViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulsaCell", for: indexPath) as! AddressCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cvList.frame.width - 10, height: 250)
    }
}


