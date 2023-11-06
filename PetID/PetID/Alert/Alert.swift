//
//  Alert.swift
//  PetID
//
//  Created by Gabriel Mors  on 05/11/23.
//

import Foundation
import UIKit

class Alert {
    
    var controller: UIViewController?
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    
    public func createAlert(title: String, message: String, preferredStyle: UIAlertController.Style ,completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
            completion?()
        }
        alertController.addAction(confirmAction)
        self.controller?.present(alertController, animated: true)
    }
}
