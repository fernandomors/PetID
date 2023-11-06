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
    
    private func configView() {
        view.backgroundColor = UIColor.secondary
        
        
        viewSettingsView.backgroundColor = UIColor.primary
        viewSettingsView.roundCorners(cornerRadiuns: 30, typeCorners: [.InferiorEsquerdo, .InferiorDireito])
    }
    
    private func configImage() {
        imagePersonButton.setImage(UIImage(named: "PersonProfile"), for: .normal)
        imagePersonButton.imageView?.sizeThatFits(CGSize.init(width: 100, height: 100))
        
        logoImage.image = UIImage(named: "LogoP")
    }

    private func labelPattern(label: UILabel, text: String, font: UIFont, color: UIColor) {
        label.text = text
        label.font = font
        label.textColor = color
    }

    private func configLabel() {
        labelPattern(label: namePersonLabel, text: "Fernando Mors", font: UIFont.systemFont(ofSize: 18, weight: .bold), color: .white)
        labelPattern(label: SettingsLabel, text: "Ajustes", font: UIFont.systemFont(ofSize: 20, weight: .bold), color: .white)
    }
    
    private func buttonPattern(button: UIButton, title: String, backgraund: UIColor, tintcolor: UIColor, radius: CGFloat) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgraund
        button.tintColor = tintcolor
        button.layer.cornerRadius = radius
    }
    
    private func configButton() {
        buttonPattern(button: editProfileButton, title: "Editar perfil", backgraund: UIColor.white, tintcolor: UIColor.TextPrimary, radius: 10)
        buttonPattern(button: changePasswordButton, title: "Trocar senha", backgraund: UIColor.white, tintcolor: UIColor.TextPrimary, radius: 10)
        buttonPattern(button: myPetsButton, title: "Meus pets", backgraund: UIColor.white, tintcolor: UIColor.TextPrimary, radius: 10)
    }
    
}
