//
//  RegisterViewCpntroller.swift
//  PetID
//
//  Created by Fernando Mors on 30/09/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
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
        validaTextField()
        
    }
    func configDelegate() {
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func textFieldPattern(TextField: UITextField, Placeholder: String, Radius: CGFloat, maskToBounds: Bool) {
        TextField.placeholder = Placeholder
        TextField.layer.cornerRadius = Radius
        TextField.layer.masksToBounds = maskToBounds
    }
    
    func configTextField() {
        textFieldPattern(TextField: nameTextField, Placeholder: "Nome", Radius: 10, maskToBounds: true)
        textFieldPattern(TextField: lastNameTextField, Placeholder: "Sobrenome", Radius: 10, maskToBounds: true)
        textFieldPattern(TextField: emailTextField, Placeholder: "Email", Radius: 10, maskToBounds: true)
        textFieldPattern(TextField: passwordTextField, Placeholder: "Senha", Radius: 10, maskToBounds: true)
        textFieldPattern(TextField: confirmPasswordTextField, Placeholder: "Confirme a senha", Radius: 10, maskToBounds: true)
    }
    
    func configView() {
        view.backgroundColor = UIColor.primary
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
        createAccountButton.backgroundColor = UIColor.secondary
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.tintColor = UIColor.TextPrimary
        createAccountButton.setTitle("Criar conta", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
        
    }
    
    
    func validaTextField() {
        if nameTextField.text != "" && lastNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            createAccountButton.isEnabled = true
        } else {
            createAccountButton.isEnabled = false
        }
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
