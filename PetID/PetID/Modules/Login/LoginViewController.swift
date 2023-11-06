//
//  LoginViewController.swift
//  PetID
//
//  Created by Fernando Mors on 27/09/23.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

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
    
    private var viewModel: LoginViewModel = LoginViewModel()
    private var auth: Auth?
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        configDelegate()
        configTextField()
        configView()
        configImage()
        configLabel()
        configButton()
        validateFieldToLogin()
    }
    
    @IBAction func tappedResetPasswordButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: RecoverPasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RecoverPasswordViewController.self)) as? RecoverPasswordViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
        let validateEmail = viewModel.validateEmail(emailTextField.text ?? "")
        let validatePassword = viewModel.validatePassword(passwordTextField.text ?? "")
        
        if validateEmail && validatePassword {
            validateFieldToLogin()
        } else {
            alert?.createAlert(title: "Erro!", message: "Os campos não podem estar vazios e os dados precisam ser válidos", preferredStyle: .alert)
        }
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: String(describing: RegisterViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as? RegisterViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedLogGoogleButton(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }

            let user = signInResult.user // here i got access to the user
            
            let viewController = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
            self.resetTextField()
            self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)

        }
    }
    
    private func validateFieldToLogin() {
        self.auth?.signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "", completion: { user, error in
            if error != nil {
                self.alert?.createAlert(title: "Atenção", message: "Dados incorretos", preferredStyle: .alert)
            } else {
                if user == nil {
                    self.alert?.createAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde", preferredStyle: .alert)
                } else {
                    let viewController = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
                    self.resetTextField()
                    self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
                }
            }
        })
    }
    
    private func configDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func resetTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
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
    
    private func ButtonPattern(button: UIButton, title: String, titleColor: UIColor, background: UIColor, radius: CGFloat, opacidadeDaSombra: Float, raioDaSombra: CGFloat, corDaSombra: CGColor, direcaoSombra: CGSize) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = background
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = radius
        button.layer.shadowOpacity = opacidadeDaSombra // Opacidade
        button.layer.shadowRadius = raioDaSombra   // Raio
        button.layer.shadowColor = corDaSombra  // Cor
        button.layer.shadowOffset = direcaoSombra   // Direção
    }
    
    private func configButton(){
        ButtonPattern(button: enterButton, title: "Entrar", titleColor: .TextPrimary , background: .titlePrimary, radius: 10, opacidadeDaSombra: 0.3, raioDaSombra: 2, corDaSombra: UIColor.black.cgColor, direcaoSombra:  CGSize(width: 0, height: 3))
        ButtonPattern(button: registerButton, title: "Registre-se agora", titleColor: .white, background: .clear, radius: 0, opacidadeDaSombra: 0.0, raioDaSombra: 0, corDaSombra: UIColor.black.cgColor, direcaoSombra:  CGSize(width: 0, height: 0))
        ButtonPattern(button: resetPasswordButton, title: "Redefinir senha", titleColor: .white, background: .clear, radius: 0, opacidadeDaSombra: 0.0, raioDaSombra: 0, corDaSombra: UIColor.black.cgColor, direcaoSombra:  CGSize(width: 0, height: 0))
        
    }
    
    private func validaTextField() {
        if ((emailTextField.text?.isEmpty) != nil) && ((passwordTextField.text?.isEmpty) != nil) {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    // Este metodo é disparado quando o teclado é levantado
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    // Este metodo é disparado o teclado é abaixado
    func textFieldDidEndEditing(_ textField: UITextField) {
        validaTextField()
    }
    
    // Este método sempre é disparado quando clicamos no botão "retorno"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
}
