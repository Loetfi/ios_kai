//
//  ListPinjamanViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class ListPinjamanViewController: BaseViewController {

    @IBOutlet weak var cvList: UICollectionView!
    @IBOutlet weak var navBar: NavigationBar!
    
    var buttonList = ["50.000", "75.000", "100.000", "150.000", "200.000", "250.000"]
    var imgList =  ["Rp 50.500", "Rp 75.500", "Rp 100.500", "Rp 150.500", "Rp 200.500", "Rp 250.500"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupCell()
        navigationBarSetup(navBar: navBar, title: "Pinjaman", hideBackButton: false)
    }
    func setupCell(){
        cvList.delegate = self
        cvList.dataSource = self
        let nibCollection = UINib(nibName: "ListPinjamanCollectionViewCell", bundle: nil)
        cvList.register(nibCollection, forCellWithReuseIdentifier: "PulsaCell")
        cvList.allowsSelection = true
        cvList.contentInsetAdjustmentBehavior = .always
        cvList.allowsMultipleSelection = false
    }
    
}

extension ListPinjamanViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulsaCell", for: indexPath) as! ListPinjamanCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cvList.frame.width - 10, height: 120)
    }
}
