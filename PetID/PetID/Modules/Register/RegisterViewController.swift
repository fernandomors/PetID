//
//  RegisterViewCpntroller.swift
//  PetID
//
//  Created by Fernando Mors on 30/09/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    private var alert: Alert = Alert()
    private let viewModel = RegisterViewModel()
    private var auth: Auth?
    private var firestore: Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegate()
        configTextField()
        configView()
        configLabel()
        configImage()
        configButton()
        validaTextField()
        self.auth = Auth.auth()
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
        guard let nameValue = nameTextField.text,
                      let emailValue = emailTextField.text,
                      let passwordValue = passwordTextField.text,
                      let confirmPasswordValue = confirmPasswordTextField.text
                else {return}

        if viewModel.validateForms(name: nameValue, email: emailValue, password: passwordValue, confirmPassword: confirmPasswordValue) {
            self.registerNewUser()
        } else {
            self.alert.createAlert(title: "Atenção", message: "Erro ao cadastrar")
        }
    }
    
    func validaTextField() {
        if nameTextField.text != "" && lastNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            createAccountButton.isEnabled = true
        } else {
            createAccountButton.isEnabled = false
        }
    }
    
    private func registerNewUser() {
        
        guard let emailValid = emailTextField.text, let passwordValid = passwordTextField.text else {return}
        self.auth?.createUser(withEmail: emailValid, password: passwordValid, completion: { result, error in
            if error != nil {
                self.alert.createAlert(title: "Erro!", message: "Esse e-mail ja existe")
            } else {
                if let idUser = result?.user.uid {
                    self.firestore?.collection("usuários").document(idUser).setData([
                        "Nome": self.nameTextField.text ?? "",
                        "Email": self.emailTextField.text ?? "",
                        "id": idUser
                    ])
                }
                self.alert.createAlert(title: "Sucesso", message: "Cadastro Efetuado com sucesso!", completion: {
                    self.login()
                })
            }
        })
    }
    
    private func login() {
        let tabBarController = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? UITabBarController
        self.navigationController?.pushViewController(tabBarController ?? UITabBarController(), animated: true)
        
    }
    
    private func configDelegate() {
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
        createAccountButton.layer.shadowOpacity = 0.5 // Opacidade
        createAccountButton.layer.shadowRadius = 2   // Raio
        createAccountButton.layer.shadowColor = UIColor.black.cgColor  // Cor
        createAccountButton.layer.shadowOffset = CGSize(width: 0, height: 3)   // Direção
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getConfigTextFieldShouldReturn(textField: textField, nameTextField: nameTextField, emailTextField: emailTextField, passwordTextField: passwordTextField, confirmPasswordTextField: confirmPasswordTextField)
    }
}
