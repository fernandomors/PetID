//
//  AddPetViewModel.swift
//  PetID
//
//  Created by Fernando Mors on 27/11/23.
//

import UIKit

class AddPetViewModel{

    public func getConfigTextFieldShouldReturn(textField: UITextField, namePetTextField: UITextField, breedPetTextField: UITextField, sexPetTextField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case namePetTextField:
            breedPetTextField.becomeFirstResponder()
        case breedPetTextField:
            sexPetTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
