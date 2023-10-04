//
//  ExtensionUiView.swift
//  PetID
//
//  Created by Fernando Mors on 04/10/23.
//

import Foundation
import UIKit


extension UIView {
    
    func roundCorners(cornerRadiuns: CGFloat, typeCorners: CACornerMask) {
        self.layer.cornerRadius = cornerRadiuns
        self.layer.maskedCorners = typeCorners
        self.clipsToBounds = true
    }
}


extension CACornerMask {
    
    static public let InferiorDireito: CACornerMask = .layerMaxXMaxYCorner
    static public let InferiorEsquerdo: CACornerMask = .layerMinXMaxYCorner
    static public let SuperiorDireito: CACornerMask = .layerMaxXMinYCorner
    static public let SuperiorEsquerdo: CACornerMask = .layerMinXMinYCorner
    
}
