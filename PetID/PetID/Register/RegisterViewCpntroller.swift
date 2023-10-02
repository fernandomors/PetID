//
//  RegisterViewCpntroller.swift
//  PetID
//
//  Created by Fernando Mors on 30/09/23.
//

import UIKit

class RegisterViewCpntroller: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var createAccountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configTextField() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
    }
    

}

extension RegisterViewCpntroller: UITextFieldDelegate {
    
}
