//
//  TabBarController.swift
//  PetID
//
//  Created by Fernando Mors on 03/10/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        configLayout()
    }
    
    func addControllers() {
        
        let firstVC: UINavigationController = {
            let vc = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
            return nav
        }()
        
        let secondsVC: UINavigationController = {
            let vc = UIStoryboard(name: "VaccinesViewController", bundle: nil).instantiateViewController(withIdentifier: "VaccinesViewController") as? VaccinesViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Vaccines", image: UIImage(named: "Vaccine"), tag: 1)
            return nav
        }()
        
        let lastVC: UINavigationController = {
            let vc = UIStoryboard(name: "SettingsViewController", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
            let nav = UINavigationController(rootViewController: vc ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Ajustes", image: UIImage(named: "Settings"), tag: 2)
            return nav
        }()
        
        viewControllers = [firstVC, secondsVC, lastVC]
    }
    
    func configLayout() {
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = UIColor(red: 121/255, green: 90/255, blue: 69/255, alpha: 1.0)
        tabBar.tintColor = UIColor.white
    }
    
}
