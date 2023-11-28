//
//  AddVaccinesViewModel.swift
//  PetID
//
//  Created by Fernando Mors on 27/11/23.
//

import UIKit

class AddVaccinesViewModel {

    public func getConfigTextFieldShouldReturn(textField: UITextField, nameVaccinesTextField: UITextField, petVaccinesTextField: UITextField, dateVaccinesTextField: UITextField) -> Bool{
        textField.resignFirstResponder()
        
        switch textField {
        case nameVaccinesTextField:
            petVaccinesTextField.becomeFirstResponder()
        case petVaccinesTextField:
            dateVaccinesTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
