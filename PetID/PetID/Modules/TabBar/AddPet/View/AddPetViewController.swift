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
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var numberKilosLabel: UILabel!
    @IBOutlet weak var kgPetSlider: UISlider!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var registerPetButton: UIButton!
    
    private var viewModel = AddPetViewModel()
    
    
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
    
    private func labelPattern(label: UILabel, text: String, textColor: UIColor, font: UIFont) {
        label.text = text
        label.textColor = textColor
        label.font = font
    }
    
    func configLabel() {
        labelPattern(label: registerPetLabel, text: "Cadastrar", textColor: UIColor.secondary, font: UIFont.systemFont(ofSize: 22, weight: .semibold))
        labelPattern(label: weightLabel, text: "Peso", textColor: UIColor.secondary, font: UIFont.systemFont(ofSize: 22, weight: .semibold))
        
        labelPattern(label: numberKilosLabel, text: "0", textColor: UIColor.secondary, font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        labelPattern(label: kgLabel, text: "kg", textColor: UIColor.secondary, font: UIFont.systemFont(ofSize: 16, weight: .semibold))
    }
    
    func configButton() {
        petPhotoButton.setImage(UIImage(named: "PetProfile"), for: .normal)
        petPhotoButton.tintColor = UIColor.secondary
        
        registerPetButton.setTitle("Cadastrar pet", for: .normal)
        registerPetButton.setTitleColor(UIColor.TextPrimary, for: .normal)
        registerPetButton.backgroundColor = UIColor.secondary
        registerPetButton.layer.cornerRadius = 10
        
    }
    
    func configSlider() {
        kgPetSlider.minimumValue = 0
        kgPetSlider.value = 5
        kgPetSlider.maximumValue = 40
        kgPetSlider.minimumTrackTintColor = UIColor.secondary
        kgPetSlider.thumbTintColor = UIColor.TextPrimary
        kgPetSlider.maximumTrackTintColor = UIColor.secondary
        
    }
    
    func configSegmentedControl() {
        petSizeSegmentedControl.setTitle("Pequeno", forSegmentAt: 0)
        petSizeSegmentedControl.setTitle("Médio", forSegmentAt: 1)
        petSizeSegmentedControl.insertSegment(withTitle: "Grande", at: 2, animated: true)
        petSizeSegmentedControl.backgroundColor = UIColor.secondary
        petSizeSegmentedControl.selectedSegmentTintColor = UIColor.TextPrimary
        
        
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.TextPrimary]
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondary]
        
        petSizeSegmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        petSizeSegmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
    }
    
    @IBAction func tappedKgPetSlider(_ sender: UISlider) {
        numberKilosLabel.text = String(Int(sender.value))
    }
    
    @IBAction func tappedPetSizeSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        namePetTextField.resignFirstResponder();breedPetTextField.resignFirstResponder();sexPetTextField.resignFirstResponder()
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
        viewModel.getConfigTextFieldShouldReturn(textField: textField, namePetTextField: namePetTextField, breedPetTextField: breedPetTextField, sexPetTextField: sexPetTextField)
    }
}
