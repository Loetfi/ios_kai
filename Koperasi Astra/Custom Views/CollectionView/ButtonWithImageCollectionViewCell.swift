//
//  ButtonWithImageCollectionViewCell.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 25/07/21.
//

import UIKit

class ButtonWithImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vGradient: GradientView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
