//
//  AddVaccinesViewController.swift
//  PetID
//
//  Created by Fernando Mors on 10/10/23.
//

import UIKit

class AddVaccinesViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var addVaccinesLabel: UILabel!
    
    @IBOutlet weak var nameVaccinesTextField: UITextField!
    
    @IBOutlet weak var BackgraundTextFieldPetView: UIView!
    
    @IBOutlet weak var petVaccinesTextField: UITextField!
    
    @IBOutlet weak var petOptionsButton: UIButton!
    
    @IBOutlet weak var backgraundTextFieldDateView: UIView!
    
    @IBOutlet weak var dateVaccinesTextField: UITextField!
    
    @IBOutlet weak var dateOptionsButton: UIButton!
    
    @IBOutlet weak var addVaccinesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        configView()
        configImage()
        configLabel()
        configButton()
    }
    
    func configTextField() {
        nameVaccinesTextField.delegate = self
        petVaccinesTextField.delegate = self
        dateVaccinesTextField.delegate = self
        
        nameVaccinesTextField.placeholder = "Nome:"
        petVaccinesTextField.placeholder = "Pet:"
        dateVaccinesTextField.placeholder = "Data:"
        
        nameVaccinesTextField.keyboardType = .default
        
        petVaccinesTextField.backgroundColor = .clear
        dateVaccinesTextField.backgroundColor = .clear
        nameVaccinesTextField.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        BackgraundTextFieldPetView.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        BackgraundTextFieldPetView.layer.cornerRadius = 5
        
        backgraundTextFieldDateView.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        backgraundTextFieldDateView.layer.cornerRadius = 5
    }
    
    func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    func configLabel() {
        addVaccinesLabel.text = "Adicionar vacina"
        addVaccinesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addVaccinesLabel.textColor = .white
    }
    
    func configButton() {
        addVaccinesButton.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        addVaccinesButton.layer.cornerRadius = 10
        addVaccinesButton.setTitle("Adicionar", for: .normal)
        addVaccinesButton.tintColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        
        petOptionsButton.setImage(UIImage(named: "DownArrow"), for: .normal)
        dateOptionsButton.setImage(UIImage(named: "DownArrow"), for: .normal)
        
        backButton.setImage(UIImage(named: "ButtonBack"), for: .normal)
    }
    
    @IBAction func tappedAddVaccinesButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension AddVaccinesViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
