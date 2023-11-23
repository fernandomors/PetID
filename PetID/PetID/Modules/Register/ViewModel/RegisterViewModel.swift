//
//  RegisterViewModel.swift
//  PetID
//
//  Created by Gabriel Mors  on 05/11/23.
//

import Foundation
import UIKit

class RegisterViewModel {
    
    var passwordData = ""
    
    public func validateName(_ name: String) -> Bool {
        return name.isEmpty
    }
    
    func validateEmail(_ email: String) -> Bool {
        if email.isEmpty || ((!email.contains("@")) || (!email.contains(".com"))) {
            return true
        } else {
            return false
        }
    }
    
    func validatePassword(_ password: String) -> Bool {
        passwordData = password
        return password.isEmpty || password.count < 6
    }
    
    func validateConfirmPassword(_ confirmPassword: String) -> Bool {
        return (confirmPassword != passwordData) || (confirmPassword.isEmpty)
    }
    
    func validateForms(name: String, email: String, password: String, confirmPassword: String) -> Bool {
        return (!validateName(name) && !validateEmail(email) && !validatePassword(password) && !validateConfirmPassword(confirmPassword))
    }
    
    public func getConfigTextFieldShouldReturn(textField: UITextField, nameTextField: UITextField, lastNameTextField: UITextField, emailTextField: UITextField, passwordTextField: UITextField, confirmPasswordTextField: UITextField) -> Bool{
        textField.resignFirstResponder()
        
        switch textField {
        case nameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
