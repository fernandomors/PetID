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

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configImage()
        configLabel()
        configButton()
    }
    
    private func configView() {
        view.backgroundColor = UIColor.primary
    }
    
    private func configImage() {
        logoImage.image = UIImage(named: "LogoP")
        logoNoVaccinesImage.image = UIImage(named: "NoVaccines")
    }
    
    private func labelPattern(label: UILabel, text: String, font: UIFont, color: UIColor) {
        label.text = text
        label.font = font
        label.textColor = color
    }
    
    private func configLabel() {
        labelPattern(label: vaccinesLabel, text: "Vacinas agendadas", font: UIFont.boldSystemFont(ofSize: 20), color: UIColor.white)
        labelPattern(label: descriptionNoVaccinesLabel, text: "Nenhuma vacina agendada", font: UIFont.systemFont(ofSize: 16, weight: .bold), color: UIColor.white)
    }
    
    private func configButton() {
        programVaccinesButton.setTitle("Agendar", for: .normal)
        programVaccinesButton.tintColor = UIColor.TextPrimary
        programVaccinesButton.backgroundColor = UIColor.secondary
        programVaccinesButton.layer.cornerRadius = 10
    }
    
    @IBAction func tappedProgramVaccinesButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddVaccinesViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddVaccinesViewController.self)) as? AddVaccinesViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
}
