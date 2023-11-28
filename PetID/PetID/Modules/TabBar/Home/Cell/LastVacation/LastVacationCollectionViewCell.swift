//
//  LastVacationCollectionViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 19/10/23.
//

import UIKit

class LastVacationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameVaccinesLabel: UILabel!
    @IBOutlet weak var DateVaccinesLabel: UILabel!
    @IBOutlet weak var checkVaccinesImage: UIImageView!
    @IBOutlet weak var editImage: UIImageView!
    
    static let identifier = String(describing: LastVacationCollectionViewCell.self)
    
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
        
        checkVaccinesImage.image = UIImage(named: "Check")
        
    }
    
    func configLabel() {
        nameVaccinesLabel.font = UIFont.systemFont(ofSize: 16)
        nameVaccinesLabel.textColor = UIColor.TextPrimary
        
        DateVaccinesLabel.font = UIFont.systemFont(ofSize: 16)
        DateVaccinesLabel.textColor = UIColor.TextPrimary
    }
    
    func setupCell(data: LastVacation) {
        nameVaccinesLabel.text = data.nameVaccines
        DateVaccinesLabel.text = data.dateVaccines
    }
}
