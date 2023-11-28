//
//  ProgrammedVaccinationCollectionViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 11/10/23.
//

import UIKit

class ProgrammedVaccinationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var NameVaccinesLabel: UILabel!
    @IBOutlet weak var dateVaccinesLabel: UILabel!
    @IBOutlet weak var editImage: UIImageView!
    
    static let identifier = String(describing: ProgrammedVaccinationCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
        configLabel()
    }
    
    func configImage() {
        editImage.image = UIImage(systemName: "pencil")
        editImage.frame.size = CGSize(width: 5, height: 5)
        editImage.tintColor = UIColor.TextPrimary
    }
    
    func configLabel() {
        NameVaccinesLabel.font = UIFont.systemFont(ofSize: 16)
        NameVaccinesLabel.textColor = UIColor.TextPrimary
        
        dateVaccinesLabel.font = UIFont.systemFont(ofSize: 16)
        dateVaccinesLabel.textColor = UIColor.TextPrimary
    }
    
    func setupCell(data: ProgrammedVaccinations) {
        NameVaccinesLabel.text = data.nameVaccines
        dateVaccinesLabel.text = data.dateVaccines
    }
}
