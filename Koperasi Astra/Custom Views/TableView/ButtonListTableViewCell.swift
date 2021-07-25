//
//  ButtonListTableViewCell.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 19/07/21.
//

import UIKit

class ButtonListTableViewCell: UITableViewCell {

    @IBOutlet weak var lineBottom: UIView!
    @IBOutlet weak var lineTop: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var rightArrow: UIImageView!
    
    var title: String = "" {
        didSet {
            lblTitle.text = title
        }
    }
    var titleColor: String = "" {
        didSet {
            lblTitle.textColor = UIColor(named: titleColor)
        }
    }
    
    var imageName: String = "" {
        didSet {
            ivImage.image = UIImage(named: imageName)
        }
    }
    
    var rightArrowHidden: Bool {
        set {
            rightArrow.isHidden = newValue
        }
        get {
            return rightArrow.isHidden
        }
    }
    
    var topLineHidden: Bool {
        set {
            lineTop.isHidden = newValue
        }
        get {
            return lineTop.isHidden
        }
    }
    
    var bottomLineHidden: Bool {
        set {
            lineBottom.isHidden = newValue
        }
        get {
            return lineBottom.isHidden
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
