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
    
    func configBackground() {
        view.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        
        backgraundView.backgroundColor = UIColor(red: 171/255, green: 130/255, blue: 98/255, alpha: 1.0)
        backgraundView.layer.cornerRadius = 50
        
        
        let imageViewContainer = UIView(frame: backgraundView.bounds)
        imageViewContainer.clipsToBounds = true
        let imageView = UIImageView(image: UIImage(named: "accessOne"))
        imageViewContainer.addSubview(imageView)
        backgraundView.layer.cornerRadius = view.frame.size.width / 10.0
        backgraundView.layer.masksToBounds = true
        backgraundView.clipsToBounds = false
    }
    
    func configImage() {
        accessImage.image = UIImage(named: "accessOne")
        
    }
    
    func configLabel() {
        description01Label.text = "Proteja quem você ama!"
        description01Label.textColor = UIColor.white
        description01Label.numberOfLines = 0
        description01Label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        description02Label.text = "Acompanhe as vacinas do seu pet com nosso app."
        description02Label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        description02Label.textColor = UIColor.white
        description02Label.numberOfLines = 0
        
    }
    
    func configButton() {
        nextButton.setImage(UIImage(named: "arrow"), for: .normal)
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        
    }
    
}
