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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        configView()
        configImage()
        configLabel()
        configButton()
        dateVaccinesTextField.inputAccessoryView = self.addDoneButton()
    }
    
    func configTextField() {
        nameVaccinesTextField.delegate = self
        petVaccinesTextField.delegate = self
        dateVaccinesTextField.delegate = self
        
        nameVaccinesTextField.placeholder = "Nome:"
        petVaccinesTextField.placeholder = "Pet:"
        dateVaccinesTextField.placeholder = "Data:"
        
        nameVaccinesTextField.keyboardType = .default
        
        petVaccinesTextField.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        dateVaccinesTextField.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        nameVaccinesTextField.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        
        
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
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
    
    func addDoneButton() -> UIToolbar{
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
