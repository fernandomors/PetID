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
    
    var viewModel: HomeViewModel = HomeViewModel()
    
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
        layout.minimumInteritemSpacing = 100
        
        programmedVaccinationsCollectionView.collectionViewLayout = layout
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
        addPetButton.layer.shadowOpacity = 0.3
        addPetButton.layer.shadowRadius = 2
        addPetButton.layer.shadowColor = UIColor.black.cgColor
        addPetButton.layer.shadowOffset =  CGSize(width: 0, height: 3)
    }
    
    private func labelPattern(label: UILabel, text: String, color: UIColor, font: UIFont) {
        label.text = text
        label.textColor = color
        label.font = font
    }
    
    func configLabel() {
        labelPattern(label: NamePersonLabel, text: "Olá, Fernando", color: UIColor.white, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
        labelPattern(label: NamePetLabel, text: "Luna", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 26, weight: .bold))
        labelPattern(label: breedPetLabel, text: "Golden", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 12, weight: .regular))
        labelPattern(label: programmedVaccinationsLabel, text: "Vacinas agendadas", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 16, weight: .bold))
        labelPattern(label: lastVaccinesLabel, text: "Últimas vacinas", color: UIColor.TextPrimary, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    }
    
    func configImage() {
        personImage.image = UIImage(systemName: "person.crop.circle.fill")
        personImage.tintColor = UIColor.white
    }
    
    @IBAction func tappedAddPetButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: RegisteredPetsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisteredPetsViewController.self)) as? RegisteredPetsViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
    @IBAction func tappedProgrammedButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: String(describing: AddVaccinesViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: AddVaccinesViewController.self)) as? AddVaccinesViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == ViewPetsCollectionView) {
            return viewModel.getListPets
        } else if (collectionView == programmedVaccinationsCollectionView) {
            return viewModel.getListVaccinesProgrameed
        } else if (collectionView == lastVaccinesCollectionView) {
            return viewModel.getListLastVacation
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ViewPetsCollectionView {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.identifier, for: IndexPath()) as? PetsCollectionViewCell
            cell1?.setupCell(data: viewModel.getPets(index: indexPath))
            return cell1 ?? UICollectionViewCell()
        } else if collectionView == programmedVaccinationsCollectionView {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: ProgrammedVaccinationCollectionViewCell.identifier, for: IndexPath()) as? ProgrammedVaccinationCollectionViewCell
            cell2?.setupCell(data: viewModel.getListVaccinesProgrameed(index: indexPath))
            cell2?.layer.cornerRadius = 8
            return cell2 ?? UICollectionViewCell()
        } else if collectionView == lastVaccinesCollectionView {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LastVacationCollectionViewCell.identifier), for: IndexPath()) as? LastVacationCollectionViewCell
            cell3?.setupCell(data: viewModel.getLastVacation(index: indexPath))
            cell3?.layer.cornerRadius = 8
            return cell3 ?? UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ViewPetsCollectionView {
            return CGSize(width: 120, height: 120)
        } else if collectionView == programmedVaccinationsCollectionView {
            return CGSize(width: 150, height: 70)
        } else if collectionView == lastVaccinesCollectionView {
            return CGSize(width: 150, height: 70)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == ViewPetsCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        } else if collectionView == programmedVaccinationsCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        } else if collectionView == lastVaccinesCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//                    // Define o espaçamento horizontal entre as células na mesma linha aqui
//                if collectionView == ViewPetsCollectionView {
//                    return 20
//                }
//                    return 0
//                }
}
