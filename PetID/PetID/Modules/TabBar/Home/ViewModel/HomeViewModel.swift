//
//  HomeViewModel.swift
//  PetID
//
//  Created by Fernando Mors on 15/11/23.
//

import Foundation

class HomeViewModel {
    
    private var listPets: [Pets] = [Pets(name: "Luna", breed: "Golden", image: "Pet01"),
                                    Pets(name: "Garfield", breed: "Gata", image: "Pet02"),
                                    Pets(name: "Spek", breed: "buldog", image: "Pet03"),
                                    Pets(name: "Mel", breed: "Viralata", image: "Pet04")]
    
    public var getListPets: Int {
        listPets.count
    }
    
    func getPets(index: IndexPath) -> Pets {
        return listPets[index.row]
    }
    
    private var listLastVacation: [LastVacation] = [LastVacation(nameVaccines: "Giárdia", dateVaccines: "26/10/2022"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "01/03/2022"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "17/07/2019"),
                                            LastVacation(nameVaccines: "Giárdia", dateVaccines: "11/10/2018")]
    
    public var getListLastVacation: Int {
        return listLastVacation.count
    }
    
    func getLastVacation(index: IndexPath) -> LastVacation {
        return listLastVacation[index.row]
    }
    
    private var listVaccinesProgrameed: [ProgrammedVaccinations] =
                                                            [ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "26/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "27/10/2023"),
                                                            ProgrammedVaccinations(nameVaccines: "Giárdia", dateVaccines: "28/10/2023")]
    
    public var getListVaccinesProgrameed: Int {
        return listVaccinesProgrameed.count
    }
    
    func getListVaccinesProgrameed(index: IndexPath) -> ProgrammedVaccinations {
        return listVaccinesProgrameed[index.row]
    }
}
