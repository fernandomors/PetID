//
//  SettingsViewController.swift
//  PetID
//
//  Created by Fernando Mors on 09/10/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var viewSettingsView: UIView!
    @IBOutlet weak var imagePersonButton: UIButton!
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var SettingsLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var myPetsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configImage()
        configLabel()
        configButton()
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        
        
        viewSettingsView.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        viewSettingsView.roundCorners(cornerRadiuns: 30, typeCorners: [.InferiorEsquerdo, .InferiorDireito])
    }
    
    func configImage() {
        imagePersonButton.setImage(UIImage(named: "PersonProfile"), for: .normal)
        imagePersonButton.imageView?.sizeThatFits(CGSize.init(width: 100, height: 100))
        
        logoImage.image = UIImage(named: "LogoP")
    }
    
    func configLabel() {
        namePersonLabel.text = "Fernando Mors"
        namePersonLabel.textColor = .white
        namePersonLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        SettingsLabel.text = "Ajustes"
        SettingsLabel.textColor = .white
        SettingsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    
    
    func configButton() {
        editProfileButton.setTitle("Editar perfil", for: .normal)
        editProfileButton.backgroundColor = UIColor.white
        editProfileButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        editProfileButton.layer.cornerRadius = 10
        
        changePasswordButton.setTitle("Trocar senha", for: .normal)
        changePasswordButton.backgroundColor = UIColor.white
        changePasswordButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        changePasswordButton.layer.cornerRadius = 10
        
        myPetsButton.setTitle("Meus pets", for: .normal)
        myPetsButton.backgroundColor = UIColor.white
        myPetsButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        myPetsButton.layer.cornerRadius = 10
        
    }
    
}
