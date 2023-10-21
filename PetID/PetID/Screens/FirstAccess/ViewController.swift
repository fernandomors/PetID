//
//  ViewController.swift
//  PetID
//
//  Created by Fernando Mors on 21/09/23.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var accessImage: UIImageView!
    @IBOutlet weak var backgraundView: UIView!
    @IBOutlet weak var description01Label: UILabel!
    @IBOutlet weak var description02Label: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        configImage()
        configLabel()
        configButton()
        
    }
    
    private func configBackground() {
        view.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        
        backgraundView.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        
        backgraundView.roundCorners(cornerRadiuns: 50, typeCorners: [.SuperiorEsquerdo,.SuperiorDireito])
        backgraundView.layer.masksToBounds = true
        backgraundView.clipsToBounds = false
    }
    
    private func configImage() {
        accessImage.image = UIImage(named: "accessOne")
        
    }
    
    private func LabelPattern(label: UILabel, text: String, color: UIColor, font: UIFont) {
        label.text = text
        label.textColor = color
        label.font = font
    }
    
    private func configLabel() {
        LabelPattern(label: description01Label, text: "Proteja quem você ama!", color: UIColor.white, font: UIFont.systemFont(ofSize: 30, weight: .semibold))
        LabelPattern(label: description02Label, text: "Acompanhe as vacinas do seu pet.", color: UIColor.white, font: UIFont.systemFont(ofSize: 30, weight: .light))
    }
    
    private func configButton() {
        nextButton.setImage(UIImage(named: "arrow"), for: .normal)
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        
    }
    
}
