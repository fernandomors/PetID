//
//  RegisteredPetsTableViewCell.swift
//  PetID
//
//  Created by Fernando Mors on 26/10/23.
//

import UIKit

class RegisteredPetsTableViewCell: UITableViewCell {

    @IBOutlet weak var namePetLabel: UILabel!
    
    static let identifier: String = String(describing: RegisteredPetsTableViewCell.self)
    
    static func nib() ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        namePetLabel.text = "Luna"
        backgroundView?.backgroundColor = UIColor.primary
    }
        
    func setupCell(data: RegisteredPets) {
        namePetLabel.text = data.namePet
    }
}
