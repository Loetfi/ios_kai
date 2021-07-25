//
//  CollectionListViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 25/07/21.
//

import UIKit

class CollectionListViewController: BaseViewController {

    @IBOutlet weak var cvList: UICollectionView!
    
    var completionHandler : ((_ vc: CollectionListViewController) -> Void)?
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
    }
    
    func setupCell(){
        cvList.delegate = self
        cvList.dataSource = self
        let nibCollection = UINib(nibName: "ButtonWithImageCollectionViewCell", bundle: nil)
        cvList.register(nibCollection, forCellWithReuseIdentifier: "ButtonImageCell")
        cvList.allowsSelection = true
    }
}

extension CollectionListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonImageCell", for: indexPath) as! ButtonWithImageCollectionViewCell
        
        if indexPath.row == 0 {
            cell.lblDescription.text = "Ambil foto"
            if #available(iOS 13.0, *) {
                cell.ivImage.image = UIImage(systemName: "camera")
            }
            cell.vGradient.startColor = UIColor(named: "blue01")!
            cell.vGradient.endColor = UIColor(named: "blue02")!
        } else {
            cell.lblDescription.text = "Pilih dari galeri"
            if #available(iOS 13.0, *) {
                cell.ivImage.image = UIImage(systemName: "photo")
            }
            cell.vGradient.startColor = UIColor(named: "red02")!
            cell.vGradient.endColor = UIColor(named: "red03")!
        }
        
        return cell
    }
    
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            type = "camera"
            self.completionHandler?(self)
            let parent = self.sheetViewController
            parent?.attemptDismiss(animated: true)
        } else {
            type = "scan"
            self.completionHandler?(self)
            let parent = self.sheetViewController
            parent?.attemptDismiss(animated: true)
        }
    }
    
}

extension CollectionListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvList {
                let size:CGFloat = (cvList.bounds.width - 60) / 2.0
                return CGSize(width: size, height: 120)
        } else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
    }
}
