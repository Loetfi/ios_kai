//
//  PulsaCollectionViewCell.swift
//  Kogoro Apps
//
//  Created by Kevin Correzian on 05/09/21.
//

import UIKit

class PulsaCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vBorder: CardView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
