//
//  HomeViewController.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import UIKit

class HomeViewController: ViewController {

    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var NamePersonLabel: UILabel!
    
    @IBOutlet weak var addPetButton: UIButton!
    
    @IBOutlet weak var viewPets: UICollectionView!
    
    @IBOutlet weak var NamePetLabel: UILabel!
    
    @IBOutlet weak var breedPetLabel: UILabel!
    
    @IBOutlet weak var viewVaccines: UICollectionView!
    
    @IBOutlet weak var programmedButton: UIButton!
    
    var listPets: [Pets] = [Pets(name: "Luna", breed: "Golden", image: "Pet01"), 
                            Pets(name: "Garfield", breed: "Gata", image: "Pet02"), 
                            Pets(name: "Spek", breed: "buldog", image: "Pet03")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
    }
    
    func configCollectionView() {
        viewPets.delegate = self
        viewPets.dataSource = self
        viewPets.register(PetsCollectionViewCell.nib(), forCellWithReuseIdentifier: PetsCollectionViewCell.identifier)
        
    }
    
    @IBAction func tappedAddPet(_ sender: UIButton) {
    }
    
    @IBAction func tappedProgrammedButton(_ sender: UIButton) {
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listPets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.identifier, for: IndexPath()) as? PetsCollectionViewCell
        cell?.setupCell(data: listPets[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    
}
