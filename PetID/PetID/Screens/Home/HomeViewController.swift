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
    @IBOutlet weak var programmedVaccinationsLabel: UILabel!
    @IBOutlet weak var programmedVaccinationsCollectionView: UICollectionView!
    @IBOutlet weak var lastVaccinesLabel: UILabel!
    @IBOutlet weak var lastVaccinesCollectionView: UICollectionView!
    @IBOutlet weak var programmedButton: UIButton!
    
    var listPets: [Pets] = [Pets(name: "Luna", breed: "Golden", image: "Pet01"),
                            Pets(name: "Garfield", breed: "Gata", image: "Pet02"),
                            Pets(name: "Spek", breed: "buldog", image: "Pet03"), Pets(name: "Mel", breed: "Viralata", image: "Pet04")]
    
    var listVaccinesProgrameed: [ProgrammedVaccinations] = [ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "26/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "26/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "26/10/2023")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPetCollectionView()
        configProgrammedVaccinesCollectionView()
        configLabel()
        configView()
        configButton()
        configImage()
    }
    
    func configPetCollectionView() {
        ViewPetsCollectionView.delegate = self
        ViewPetsCollectionView.dataSource = self
        ViewPetsCollectionView.register(PetsCollectionViewCell.nib(), forCellWithReuseIdentifier: PetsCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        ViewPetsCollectionView.setCollectionViewLayout(layout, animated: true)
        ViewPetsCollectionView.backgroundColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func configProgrammedVaccinesCollectionView() {
        programmedVaccinationsCollectionView.delegate = self
        programmedVaccinationsCollectionView.dataSource = self
        programmedVaccinationsCollectionView.register(ProgrammedVaccinationCollectionViewCell.nib(), forCellWithReuseIdentifier: ProgrammedVaccinationCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        programmedVaccinationsCollectionView.setCollectionViewLayout(layout, animated: true)
        programmedVaccinationsCollectionView.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        
        // deixar um espaçamento entre as celulas
//        layout.minimumInteritemSpacing = 100
//        
//        programmedVaccinationsCollectionView.collectionViewLayout = layout
    }
    
    func configView() {
        view.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 222/255, alpha: 1.0)
        ViewPets.backgroundColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func configButton() {
        programmedButton.setTitle("Agendar", for: .normal)
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
        NamePetLabel.font = UIFont.boldSystemFont(ofSize: 26)
        
        breedPetLabel.text = "Golden"
        breedPetLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        breedPetLabel.font = UIFont.systemFont(ofSize: 12)
        
        programmedVaccinationsLabel.text = "Vacinas agendadas"
        programmedVaccinationsLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        programmedVaccinationsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        lastVaccinesLabel.text = "Últimas vacinas"
        lastVaccinesLabel.font = UIFont.boldSystemFont(ofSize: 16)
        lastVaccinesLabel.textColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
    }
    
    func configImage() {
        personImage.image = UIImage(systemName: "person.crop.circle.fill")
        personImage.tintColor = UIColor.white
    }
    
    @IBAction func tappedAddPetButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tappedProgrammedButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddVaccinesViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddVaccinesViewController.self)) as? AddVaccinesViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listPets.endIndex + listVaccinesProgrameed.endIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ViewPetsCollectionView {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.identifier, for: IndexPath()) as? PetsCollectionViewCell
            cell1?.setupCell(data: listPets[indexPath.row])
            return cell1 ?? UICollectionViewCell()
        } else if collectionView == programmedVaccinationsCollectionView {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: ProgrammedVaccinationCollectionViewCell.identifier, for: IndexPath()) as? ProgrammedVaccinationCollectionViewCell
            cell2?.setupCell(data: listVaccinesProgrameed[indexPath.row])
            cell2?.layer.cornerRadius = 8
            return cell2 ?? UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ViewPetsCollectionView {
            return CGSize(width: 100, height: 100)
        } else if collectionView == programmedVaccinationsCollectionView {
            return CGSize(width: 150, height: 70)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(listPets[indexPath.row].name)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            // Define o espaçamento horizontal entre as células na mesma linha aqui
//            return 100
//        }
}
