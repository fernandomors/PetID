//
//  LoginViewModel.swift
//  PetID
//
//  Created by Gabriel Mors  on 05/11/23.
//

import UIKit

class LoginViewModel {
    
    public func validateEmail(_ email: String) -> Bool {
        if email.isEmpty || ((!email.contains("@")) || (!email.contains(".com"))) {
            return false
        } else {
            return true
        }
    }
    
    public func validatePassword(_ password: String) -> Bool {
        return !(password.count < 6)
    }
}
