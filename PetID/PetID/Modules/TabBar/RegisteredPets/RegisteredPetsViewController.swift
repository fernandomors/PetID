//
//  RegisteredPetsViewController.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import UIKit

class RegisteredPetsViewController: UIViewController {
    
    var listRegisteredPets: [RegisteredPets] = [RegisteredPets(namePet: "Luna"), RegisteredPets(namePet: "Mel"), RegisteredPets(namePet: "Speck")]
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var myPetsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddPetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableViewProtocol()
        configTableView()
        configImage()
        configView()
        configLabel()
        configButton()
    }
    
    func tableViewProtocol() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegisteredPetsTableViewCell.nib(), forCellReuseIdentifier: RegisteredPetsTableViewCell.identifier)
    }
    func configTableView() {
        tableView.backgroundColor = .clear
    }
    
    func configImage() {
        LogoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    func configView() {
        view.backgroundColor = UIColor.primary
    }
    func configLabel() {
        myPetsLabel.text = "Meus pets"
        myPetsLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        myPetsLabel.textColor = .secondary
    }
    func configButton() {
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
        
        if let plusImage = UIImage(systemName: "plus") {
            let coloredImage = plusImage.withTintColor(UIColor.primary, renderingMode: .alwaysOriginal)
            AddPetButton.setImage(coloredImage, for: .normal)
        }
        AddPetButton.backgroundColor = UIColor.secondary
        AddPetButton.layer.cornerRadius = 10
        AddPetButton.layer.shadowOpacity = 0.3 // Opacidade
        AddPetButton.layer.shadowRadius = 4   // Raio
        AddPetButton.layer.shadowColor = UIColor.black.cgColor // Cor
        AddPetButton.layer.shadowOffset = CGSize(width: 0, height: 3)   // Direção
    }
    
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedAddPetButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddPetViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddPetViewController.self)) as? AddPetViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
}
extension RegisteredPetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRegisteredPets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RegisteredPetsTableViewCell.self), for: indexPath) as? RegisteredPetsTableViewCell
        cell?.setupCell(data: listRegisteredPets[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
