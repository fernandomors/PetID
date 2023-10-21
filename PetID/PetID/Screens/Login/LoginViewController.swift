//
//  LoginViewController.swift
//  PetID
//
//  Created by Fernando Mors on 27/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgraundView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var connectGoogleLabel: UILabel!
    @IBOutlet weak var googleButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegate()
        configTextField()
        configView()
        configImage()
        configLabel()
        configButton()
        validaTextField()
    }
    
    private func configDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func TextFieldPattern(textField: UITextField, placeholder: String, cornerRadius: CGFloat, bounds: Bool, isSecure: Bool) {
        textField.placeholder = placeholder
        textField.layer.cornerRadius = cornerRadius
        textField.layer.masksToBounds = bounds
        textField.isSecureTextEntry = isSecure
    }
    
    private func configTextField() {
        
        TextFieldPattern(textField: emailTextField, placeholder: "Usuário ou email", cornerRadius: 10, bounds: true, isSecure: false)
        TextFieldPattern(textField: passwordTextField, placeholder: "Senha", cornerRadius: 10, bounds: true, isSecure: true)
    }
    
    private func configView() {
        view.backgroundColor = UIColor.secondary
        
        backgraundView.backgroundColor = UIColor.primary
        backgraundView.roundCorners(cornerRadiuns: 80, typeCorners: .InferiorDireito)
    }
    
    private func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    private func configLabel() {
        enterLabel.text = "Entrar"
        enterLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        connectGoogleLabel.text = "ou conecte-se com"
        enterLabel.textColor = .white
        connectGoogleLabel.textColor = UIColor.TextPrimary
    }
    
    private func ButtonPattern(button: UIButton, title: String, titleColor: UIColor, background: UIColor, radius: CGFloat) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = background
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = radius 
        
    }
    
    private func configButton(){
        ButtonPattern(button: enterButton, title: "Entrar", titleColor: .TextPrimary , background: .titlePrimary, radius: 10)
        ButtonPattern(button: registerButton, title: "Registre-se agora", titleColor: .white, background: .clear, radius: 0)
        ButtonPattern(button: resetPasswordButton, title: "Redefinir senha", titleColor: .white, background: .clear, radius: 0)
        
    }
    
    private func validaTextField() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
        
    }
    
    @IBAction func tappedResetPasswordButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: RecoverPasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RecoverPasswordViewController.self)) as? RecoverPasswordViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: RegisterViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as? RegisterViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    // esté metodo é disparado quando o teclado é levantado
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    // esté metodo é disparado o teclado é abaixado
    func textFieldDidEndEditing(_ textField: UITextField) {
        validaTextField()
    }
    
    // esté método sempre é disparado quando clicamos no botão "retorno"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
}
