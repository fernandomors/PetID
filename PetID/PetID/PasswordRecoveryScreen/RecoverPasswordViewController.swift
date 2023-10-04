//
//  RecoverPasswordViewController.swift
//  PetID
//
//  Created by Fernando Mors on 03/10/23.
//

import UIKit

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var recoverPasswordLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var recoverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegate()
        configView()
        configTextField()
        configImage()
        configLabel()
        configButton()

        
    }
    
    func configDelegate() {
        emailTextField.delegate = self
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        
    }
    
    func configTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    func configLabel() {
        recoverPasswordLabel.text = "Recuperar senha"
        recoverPasswordLabel.font = UIFont.boldSystemFont(ofSize: 30)
        recoverPasswordLabel.textColor = .white
        
        DescriptionLabel.text = "Por favor, insira o email para o qual deseja redefinir a senha"
        DescriptionLabel.textColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
    }
    
    func configButton() {
        recoverButton.setTitle("Redefinir", for: .normal)
        recoverButton.tintColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        recoverButton.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        recoverButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func tappedRecoverButton(_ sender: UIButton) {
    }
    
    func validaTextField() {
        if emailTextField.text != "" {
            recoverButton.isEnabled = true
        } else {
            recoverButton.isEnabled = false
        }
    }
}

extension RecoverPasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


