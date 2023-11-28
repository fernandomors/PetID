//
//  AddVaccinesViewController.swift
//  PetID
//
//  Created by Fernando Mors on 10/10/23.
//

import UIKit

class AddVaccinesViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var addVaccinesLabel: UILabel!
    @IBOutlet weak var nameVaccinesTextField: UITextField!
    @IBOutlet weak var petVaccinesTextField: UITextField!
    @IBOutlet weak var dateVaccinesTextField: UITextField!
    @IBOutlet weak var addVaccinesButton: UIButton!
    
    private var viewModel = AddVaccinesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        configView()
        configImage()
        configLabel()
        configButton()
        dateVaccinesTextField.inputAccessoryView = self.addDoneButton()
    }
    
    private func textFieldPattern(textField: UITextField, delegate: UITextFieldDelegate, radius: CGFloat, placeholder: String, keyBoard: UIKeyboardType, color: UIColor) {
        textField.delegate.self = delegate
        textField.layer.cornerRadius = radius
        textField.placeholder = placeholder
        textField.keyboardType = keyBoard
        textField.backgroundColor = color
    }
    
    private func configTextField() {
        textFieldPattern(textField: nameVaccinesTextField, delegate: self, radius: 20, placeholder: "Nome:", keyBoard: .default, color: UIColor.secondary)
        textFieldPattern(textField: petVaccinesTextField, delegate: self, radius: 10, placeholder: "Pet:", keyBoard: .default, color: UIColor.secondary)
        textFieldPattern(textField: dateVaccinesTextField, delegate: self, radius: 15, placeholder: "Data:", keyBoard: .default, color: UIColor.secondary)
    }
    
    private func configView() {
        view.backgroundColor = UIColor.primary
    }
    
    private func configImage() {
        logoImage.image = UIImage(named: "LogotipoPetIDClear")
    }
    
    private func configLabel() {
        addVaccinesLabel.text = "Adicionar vacina"
        addVaccinesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addVaccinesLabel.textColor = .white
    }
    
    private func configButton() {
        addVaccinesButton.backgroundColor = UIColor.secondary
        addVaccinesButton.layer.cornerRadius = 10
        addVaccinesButton.setTitle("Adicionar", for: .normal)
        addVaccinesButton.tintColor = UIColor.TextPrimary
    }
    
    @IBAction func tappedPetVaccinesTextField(_ sender: UITextField) {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale.init(localeIdentifier: "pt-br") as Locale
        
        datePicker.preferredDatePickerStyle = .wheels
        
        sender.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(self.exibeDate(sender:)), for: .valueChanged)
        
        
    }
    
    @objc func exibeDate(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.dateVaccinesTextField.text = formatador.string(from: sender.date)
    }
    
    private func addDoneButton() -> UIToolbar{
        let doneTooBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        doneTooBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        
        doneTooBar.items = items
        doneTooBar.sizeToFit()
        return doneTooBar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func tappedAddVaccinesButton(_ sender: UIButton) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameVaccinesTextField.resignFirstResponder();  petVaccinesTextField.resignFirstResponder(); dateVaccinesTextField.resignFirstResponder()
    }
}

extension AddVaccinesViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getConfigTextFieldShouldReturn(textField: textField, nameVaccinesTextField: nameVaccinesTextField, petVaccinesTextField: petVaccinesTextField, dateVaccinesTextField: dateVaccinesTextField)
    }
}
