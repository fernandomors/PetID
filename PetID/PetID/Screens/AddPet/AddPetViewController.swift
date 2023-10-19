//
//  AddPetViewController.swift
//  PetID
//
//  Created by Fernando Mors on 18/10/23.
//

import UIKit

class AddPetViewController: UIViewController {

    @IBOutlet weak var petPhotoButton: UIButton!
    @IBOutlet weak var registerPetLabel: UILabel!
    @IBOutlet weak var namePetTextField: UITextField!
    @IBOutlet weak var breedPetTextField: UITextField!
    @IBOutlet weak var sexPetTextField: UITextField!
    @IBOutlet weak var petSizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var kgPetSlider: UISlider!
    @IBOutlet weak var registerPetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegate()
        configTextField()
        configView()
        configLabel()
        configButton()
        configSlider()
        configSegmentedControl()
        
    }
    func configDelegate() {
        namePetTextField.delegate = self
        breedPetTextField.delegate = self
        sexPetTextField.delegate = self
    }
    
    private func TextFieldPattern(textField: UITextField, placeholder: String, cornerRadius: CGFloat, bounds: Bool, Backgraund: UIColor) {
        textField.placeholder = placeholder
        textField.layer.cornerRadius = cornerRadius
        textField.layer.masksToBounds = bounds
        textField.backgroundColor = Backgraund
        
    }
    
    func configTextField() {
        TextFieldPattern(textField: namePetTextField, placeholder: "Nome", cornerRadius: 10, bounds: true, Backgraund: UIColor.secondary)
        TextFieldPattern(textField: breedPetTextField, placeholder: "Raça", cornerRadius: 10, bounds: true, Backgraund: UIColor.secondary)
        TextFieldPattern(textField: sexPetTextField, placeholder: "Sexo", cornerRadius: 10, bounds: true, Backgraund: UIColor.secondary)
    }
    
    func configView() {
        view.backgroundColor = UIColor.primary
    }
    
    func configLabel() {
        registerPetLabel.text = "Cadastrar pet"
        registerPetLabel.textColor = UIColor.secondary
        registerPetLabel.numberOfLines = 0
    }
    
    func configButton() {
        petPhotoButton.setImage(UIImage(systemName: "pawprint.circle.fill"), for: .normal)
        petPhotoButton.tintColor = UIColor.secondary
    }
    
    func configSlider() {
        
    }
    
    func configSegmentedControl() {
        petSizeSegmentedControl.setTitle("Pequeno", forSegmentAt: 0)
        petSizeSegmentedControl.setTitle("Médio", forSegmentAt: 1)
        petSizeSegmentedControl.insertSegment(withTitle: "Grande", at: 2, animated: true)
        
        petSizeSegmentedControl.backgroundColor = UIColor.secondary
        petSizeSegmentedControl.selectedSegmentTintColor = UIColor.TextPrimary
        
    }

    @IBAction func tappedPetSizeSegmentedControl(_ sender: UISegmentedControl) {
      
    }
    
}

extension AddPetViewController: UITextFieldDelegate{
    
    // esté metodo é disparado quando o teclado é levantado
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    // esté metodo é disparado o teclado é abaixado
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    // esté método sempre é disparado quando clicamos no botão "retorno"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        return true
    }
}
