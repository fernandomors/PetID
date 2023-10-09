//
//  VaccinesCollectionViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 09/10/23.
//

import UIKit

class VaccinesCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static let identifier = String(describing: VaccinesCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
