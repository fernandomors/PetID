//
//  PetsCollectionViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import UIKit

class PetsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    
    @IBOutlet weak var namePetLabel: UILabel!
    
    @IBOutlet weak var breedPetLabel: UILabel!
    
    static let identifier = String(describing: PetsCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
    }
    
    func configImage() {
        petImage.contentMode = .scaleAspectFill 
    }
    
    func configLabel() {
    }
    
    func setupCell(data: Pets) {
        petImage.image = UIImage(named: data.image)
        namePetLabel.text = data.name
        breedPetLabel.text = data.breed
    }
}
