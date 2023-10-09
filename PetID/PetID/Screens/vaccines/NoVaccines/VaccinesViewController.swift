//
//  VaccinesViewController.swift
//  PetID
//
//  Created by Fernando Mors on 09/10/23.
//

import UIKit

class VaccinesViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var vaccinesLabel: UILabel!
    
    @IBOutlet weak var logoNoVaccinesImage: UIImageView!
    
    @IBOutlet weak var descriptionNoVaccinesLabel: UILabel!
    
    @IBOutlet weak var programVaccinesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configImage()
        configLabel()
        configButton()
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogoP")
        logoNoVaccinesImage.image = UIImage(named: "NoVaccines")
        
    }
    
    func configLabel() {
        vaccinesLabel.text = "Vacinas agendadas"
        vaccinesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        vaccinesLabel.textColor = UIColor.white
        
        descriptionNoVaccinesLabel.text = "Nenhuma vacina agendada"
        descriptionNoVaccinesLabel.textColor = UIColor.white
    }
    
    func configButton() {
        programVaccinesButton.setTitle("Agendar", for: .normal)
        programVaccinesButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        programVaccinesButton.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        programVaccinesButton.layer.cornerRadius = 10
    }
    
    @IBAction func tappedProgramVaccinesButton(_ sender: UIButton) {
    }
    
}
