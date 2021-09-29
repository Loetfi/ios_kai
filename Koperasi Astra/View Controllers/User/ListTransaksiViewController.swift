//
//  ListTransaksiViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit

class ListTransaksiViewController: BaseViewController {

    @IBOutlet weak var cvList: UICollectionView!
    @IBOutlet weak var navBar: NavigationBar!
    
    var buttonList = ["50.000", "75.000", "100.000", "150.000", "200.000", "250.000"]
    var imgList =  ["Rp 50.500", "Rp 75.500", "Rp 100.500", "Rp 150.500", "Rp 200.500", "Rp 250.500"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupCell()
        navigationBarSetup(navBar: navBar, title: "Transaksi Saya", hideBackButton: false)
    }
    func setupCell(){
        cvList.delegate = self
        cvList.dataSource = self
        let nibCollection = UINib(nibName: "ListTransaksiCollectionViewCell", bundle: nil)
        cvList.register(nibCollection, forCellWithReuseIdentifier: "PulsaCell")
        cvList.allowsSelection = true
        cvList.contentInsetAdjustmentBehavior = .always
        cvList.allowsMultipleSelection = false
    }
    
}

extension ListTransaksiViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PulsaCell", for: indexPath) as! ListTransaksiCollectionViewCell
            cell.lblTitle.text = buttonList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cvList.frame.width - 10, height: 120)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! PulsaCollectionViewCell
//        cell.vBorder.backgroundColor = UIColor(named: "green02")
//        cell.vBorder.borderColor = UIColor(named: "green01")
//        self.lblPrice.text = imgList[indexPath.row]
//        self.content = imgList1[indexPath.row]
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! PulsaCollectionViewCell
//        cell.vBorder.backgroundColor = UIColor.white
//        cell.vBorder.borderColor = UIColor(named: "black04")
//    }
}

