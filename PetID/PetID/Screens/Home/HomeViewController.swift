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
                            Pets(name: "Spek", breed: "buldog", image: "Pet03"),
                            Pets(name: "Mel", breed: "Viralata", image: "Pet04")]
    
    var listLastVacation: [LastVacation] = [LastVacation(nameVaccines: "Giárdia", dateVaccines: "26/10/2022"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "01/03/2022"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "17/07/2019"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "11/10/2018")]
    
    var listVaccinesProgrameed: [ProgrammedVaccinations] = [ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "26/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "27/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "28/10/2023")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Código para ocultar a navigation bar
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        configPetCollectionView()
        configProgrammedVaccinesCollectionView()
        configLastVacationCollectionView()
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
        ViewPetsCollectionView.backgroundColor = UIColor.TextPrimary
        ViewPetsCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func configProgrammedVaccinesCollectionView() {
        programmedVaccinationsCollectionView.delegate = self
        programmedVaccinationsCollectionView.dataSource = self
        programmedVaccinationsCollectionView.register(ProgrammedVaccinationCollectionViewCell.nib(), forCellWithReuseIdentifier: ProgrammedVaccinationCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        programmedVaccinationsCollectionView.setCollectionViewLayout(layout, animated: true)
        programmedVaccinationsCollectionView.backgroundColor = UIColor.secondary
        programmedVaccinationsCollectionView.showsHorizontalScrollIndicator = false
        
        // deixar um espaçamento entre as celulas
        //        layout.minimumInteritemSpacing = 100
        //
        //        programmedVaccinationsCollectionView.collectionViewLayout = layout
    }
    
    func configLastVacationCollectionView() {
        lastVaccinesCollectionView.delegate = self
        lastVaccinesCollectionView.dataSource = self
        lastVaccinesCollectionView.register(LastVacationCollectionViewCell.nib(), forCellWithReuseIdentifier: LastVacationCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        lastVaccinesCollectionView.setCollectionViewLayout(layout, animated: true)
        lastVaccinesCollectionView.backgroundColor = UIColor.secondary
        lastVaccinesCollectionView.showsHorizontalScrollIndicator = false
        
        
    }
    
    func configView() {
        view.backgroundColor = UIColor.secondary
        ViewPets.backgroundColor = UIColor.TextPrimary
    }
    
    func configButton() {
        programmedButton.setTitle("Agendar", for: .normal)
        programmedButton.tintColor = UIColor.white
        programmedButton.backgroundColor = UIColor.tertiary
        programmedButton.layer.cornerRadius = 10
        
        addPetButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addPetButton.tintColor = UIColor.white
    }
    
    private func labelPattern(label: UILabel, text: String, color: UIColor, font: UIFont) {
        label.text = text
        label.textColor = color
        label.font = font
    }
    
    func configLabel() {
        labelPattern(label: NamePersonLabel, text: "Olá, Fernando", color: UIColor.white, font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        labelPattern(label: NamePetLabel, text: "Luna", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 26, weight: .bold))
        labelPattern(label: breedPetLabel, text: "Golden", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 12, weight: .regular))
        labelPattern(label: programmedVaccinationsLabel, text: "Vacinas agendadas", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 16, weight: .regular))
        labelPattern(label: lastVaccinesLabel, text: "Últimas vacinas", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    }
    
    func configImage() {
        personImage.image = UIImage(systemName: "person.crop.circle.fill")
        personImage.tintColor = UIColor.white
    }
    
    @IBAction func tappedAddPetButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddPetViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddPetViewController.self)) as? AddPetViewController
        present(vc ?? ViewController(), animated: true)
    }
    
    
    @IBAction func tappedProgrammedButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddVaccinesViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddVaccinesViewController.self)) as? AddVaccinesViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == ViewPetsCollectionView) {
            return listPets.endIndex
        } else if (collectionView == programmedVaccinationsCollectionView) {
            return listVaccinesProgrameed.endIndex
        } else if (collectionView == lastVaccinesCollectionView) {
            return listLastVacation.endIndex
        }
        return 0
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
        } else if collectionView == lastVaccinesCollectionView {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LastVacationCollectionViewCell.identifier), for: IndexPath()) as? LastVacationCollectionViewCell
            cell3?.setupCell(data: listLastVacation[indexPath.row])
            cell3?.layer.cornerRadius = 8
            return cell3 ?? UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ViewPetsCollectionView {
            return CGSize(width: 100, height: 100)
        } else if collectionView == programmedVaccinationsCollectionView {
            return CGSize(width: 150, height: 70)
        } else if collectionView == lastVaccinesCollectionView {
            return CGSize(width: 150, height: 70)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(listPets[indexPath.row].name)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == ViewPetsCollectionView {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100)
//        }
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100)
//    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //            // Define o espaçamento horizontal entre as células na mesma linha aqui
    //            return 100
    //        }
}
