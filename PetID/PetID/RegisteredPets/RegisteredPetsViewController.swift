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
    }
    func configButton() {
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
        
        AddPetButton.setImage(UIImage(named: "plus"), for: .normal)
        AddPetButton.tintColor = UIColor.primary
        AddPetButton.backgroundColor = UIColor.secondary
        AddPetButton.layer.cornerRadius = 10
    }
    
    
}
extension RegisteredPetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRegisteredPets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RegisteredPetsTableViewCell.self), for: indexPath) as? RegisteredPetsTableViewCell
        cell?.setupCell(data: listRegisteredPets[indexPath.row])
        cell?.layer.cornerRadius = 8
        return cell ?? UITableViewCell()
    }
    
    
}
