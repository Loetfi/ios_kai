//
//  UIImageView.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 10/10/21.
//

import Foundation
import Nuke

extension UIImageView {
    
    func loadImage(url: String, into: UIImageView) {
        let options = ImageLoadingOptions(
            transition: .fadeIn(duration: 0.33)
        )
        
        let url: URL? = URL(string: url)
        if url != nil {
            Nuke.loadImage(with: url!, options: options, into: into, progress: { (response, _, _) in
            }) { result in
                switch result {
                case .success(_): break
                case .failure(_):
                    into.image = UIImage(named: "imgKoperasiAstra")
                }
            }
        }
    }
}
