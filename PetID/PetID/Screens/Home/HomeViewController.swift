//
//  HomeViewController.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ViewPets: UIView!
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var NamePersonLabel: UILabel!
    
    @IBOutlet weak var addPetButton: UIButton!
    
    @IBOutlet weak var ViewPetsCollectionView: UICollectionView!
    
    @IBOutlet weak var NamePetLabel: UILabel!
    
    @IBOutlet weak var breedPetLabel: UILabel!
    
    @IBOutlet weak var programmedButton: UIButton!
    
    var listPets: [Pets] = [Pets(name: "Luna", breed: "Golden", image: "Pet01"),
                            Pets(name: "Garfield", breed: "Gata", image: "Pet02"),
                            Pets(name: "Spek", breed: "buldog", image: "Pet03")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configLabel()
        configView()
        configButton()
        configImage()
    }
    
    func configCollectionView() {
        ViewPetsCollectionView.delegate = self
        ViewPetsCollectionView.dataSource = self
        ViewPetsCollectionView.register(PetsCollectionViewCell.nib(), forCellWithReuseIdentifier: PetsCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        ViewPetsCollectionView.setCollectionViewLayout(layout, animated: true)
        ViewPetsCollectionView.backgroundColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        ViewPets.backgroundColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func configButton() {
        programmedButton.setTitle("Agendadas", for: .normal)
        programmedButton.tintColor = UIColor.white
        programmedButton.backgroundColor = UIColor(red: 181/255, green: 145/255, blue: 121/255, alpha: 1.0)
        programmedButton.layer.cornerRadius = 10
        
        addPetButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addPetButton.tintColor = UIColor.white
    }
    
    func configLabel() {
        NamePersonLabel.text = "Olá, Fernando"
        NamePersonLabel.textColor = UIColor.white
        
        NamePetLabel.text = "Luna"
        NamePetLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        NamePetLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        breedPetLabel.text = "Golden"
        breedPetLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        breedPetLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func configImage() {
        personImage.image = UIImage(systemName: "person.crop.circle.fill")
        personImage.tintColor = UIColor.white
    }
    
    @IBAction func tappedAddPetButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tappedProgrammedButton(_ sender: UIButton) {
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listPets.endIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.identifier, for: IndexPath()) as? PetsCollectionViewCell
        cell?.setupCell(data: listPets[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(listPets[indexPath.row].name)
    }
}
