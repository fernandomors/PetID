//
//  PetsCollectionViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import UIKit

class PetsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCollection: UIView!
    
    @IBOutlet weak var petImage: UIImageView!
    
    @IBOutlet weak var namePetLabel: UILabel!
    
    @IBOutlet weak var breedPetLabel: UILabel!
    
    static let identifier = String(describing: PetsCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
        configImage()
        configLabel()
    }
    
    func configView() {
        viewCollection.backgroundColor = UIColor(red: 181/255, green: 145/255, blue: 121/255, alpha: 1.0)
        viewCollection.layer.cornerRadius = 5
    }
    
    func configImage() {
        petImage.contentMode = .scaleAspectFill
        petImage.layer.cornerRadius = 5
    }
    
    func configLabel() {
        namePetLabel.font = namePetLabel.font.withSize(12)
        breedPetLabel.font = breedPetLabel.font.withSize(12)
    }
    
    func setupCell(data: Pets) {
        petImage.image = UIImage(named: data.image)
        namePetLabel.text = data.name
        breedPetLabel.text = data.breed
    }
}
