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
    
    func configDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func configTextField() {
        emailTextField.placeholder = "Usuário ou email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        
        passwordTextField.placeholder = "Senha"
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
    }
    
    func configView() {
        // Mudei a cor da minha nova view
        let customCollorView = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        backgraundView.backgroundColor = customCollorView
        // Mudei a cor da minha view (View que vem por defaul)
        let custoCollorBackgraundView = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        view.backgroundColor = custoCollorBackgraundView
        backgraundView.roundCorners(cornerRadiuns: 80, typeCorners: .InferiorDireito)
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    func configLabel() {
        enterLabel.text = "Entrar"
        enterLabel.font = UIFont.boldSystemFont(ofSize: 30)
        connectGoogleLabel.text = "ou conecte-se com"
        enterLabel.textColor = .white
        
    }
    
    func configButton(){
        
        enterButton.setTitle("Entrar", for: .normal)
        let customCollorButton = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        enterButton.backgroundColor = customCollorButton
        enterButton.setTitleColor(UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0), for: .normal)
        enterButton.layer.cornerRadius = 10
        
        
        registerButton.setTitle("Registre-se agora", for: .normal)
        registerButton.tintColor = .white
        //      googleButton.setImage(UIImage(named: "GoogleImage"), for: .normal)
        //      googleButton.imageView?.contentMode = .scaleToFill
        //      googleButton.frame = CGSize(width: 30, height: 30)
        resetPasswordButton.tintColor = .white
        resetPasswordButton.setTitle("Redefinir senha", for: .normal)
        
        connectGoogleLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func validaTextField() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
        
    }
    
    @IBAction func tappedResetPasswordButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "RecoverPasswordViewController", bundle: nil).instantiateViewController(withIdentifier: "RecoverPasswordViewController") as? RecoverPasswordViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: RegisterViewController.self), bundle: nil).instantiateViewController(withIdentifier: "RegisterViewCpntroller") as? RegisterViewController
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
