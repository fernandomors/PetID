//
//  RegisteredPetsTableViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 26/10/23.
//

import UIKit

class RegisteredPetsTableViewCell: UITableViewCell {

    @IBOutlet weak var namePetLabel: UILabel!
    @IBOutlet weak var backgraundView: UIView!
    
    static let identifier: String = String(describing: RegisteredPetsTableViewCell.self)
    
    static func nib() ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .primary
        
        namePetLabel.textColor = .primary
        namePetLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backgraundView.backgroundColor = UIColor.secondary
        backgraundView.layer.cornerRadius = 8
        
    }
        
    func setupCell(data: RegisteredPets) {
        namePetLabel.text = data.namePet
    }
}
