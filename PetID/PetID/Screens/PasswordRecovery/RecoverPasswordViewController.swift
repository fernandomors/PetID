//
//  RecoverPasswordViewController.swift
//  PetID
//
//  Created by Fernando Mors on 03/10/23.
//

import UIKit

class RecoverPasswordViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
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
    
    private func configDelegate() {
        emailTextField.delegate = self
    }
    
    private func configView() {
        view.backgroundColor = UIColor.primary
        
    }
    
    private func configTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        
    }
    
    private func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    private func labelPattern(label: UILabel, text: String, font: UIFont, color: UIColor) {
        label.text = text
        label.font = font
        label.textColor = color
    }
    private func configLabel() {
        labelPattern(label: recoverPasswordLabel, text: "Recuperar senha", font: UIFont.boldSystemFont(ofSize: 30), color: .white)
        labelPattern(label: DescriptionLabel, text: "Por favor, insira o email para o qual deseja redefinir a senha", font: UIFont(), color: UIColor.secondary)
    }
    private func configButton() {
        recoverButton.setTitle("Redefinir", for: .normal)
        recoverButton.tintColor = UIColor.primary
        recoverButton.backgroundColor = UIColor.secondary
        recoverButton.layer.cornerRadius = 10
        
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
        
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedRecoverButton(_ sender: UIButton) {
    }
    
    private func validaTextField() {
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


