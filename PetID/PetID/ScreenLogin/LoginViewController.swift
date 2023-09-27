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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configImage()
        configLabel()
        configButton()
        
    }
    
    func configView() {
        // Mudei a cor da minha nova view
        let customCollorView = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        backgraundView.backgroundColor = customCollorView
        // Mudei a cor da minha view (View que vem por defaul)
        let custoCollorBackgraundView = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        view.backgroundColor = custoCollorBackgraundView
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    func configLabel() {
        enterLabel.text = "Entrar"
        connectGoogleLabel.text = "ou conecte-se com"
        
    }
    
    func configButton(){
        resetPasswordButton.setTitle("Redefinir senha", for: .normal)
        enterButton.setTitle("Entrar", for: .normal)
        registerButton.setTitle("Registre-se agora", for: .normal)
//        googleButton.setImage(UIImage(named: "GoogleImage"), for: .normal)
//        googleButton.imageView?.contentMode = .scaleToFill
//        googleButton.frame = CGSize(width: 30, height: 30)
    }
    
    
    
}
