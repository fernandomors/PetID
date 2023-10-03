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
        configDelegate()
        configTextField()
        configView()
        configLabel()
        configImage()
        configButton()
        
    }
    func configDelegate() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    func configTextField() {
        
        nameTextField.placeholder = "Nome"
        lastNameTextField.placeholder = "Sobrenome"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Senha"
        confirmPasswordTextField.placeholder = "Confirme a senha"
        
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
    }
    
    func configLabel() {
        createAccountLabel.text = "Criar conta"
        createAccountLabel.font = UIFont.boldSystemFont(ofSize: 30)
        createAccountLabel.textColor = UIColor.white
        
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogoP")
    }
    
    func configButton() {
        createAccountButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        createAccountButton.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        createAccountButton.setTitle("Criar conta", for: .normal)
    }
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
    }
    
    
}

extension RegisterViewCpntroller: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
