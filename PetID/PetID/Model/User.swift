//
//  User.swift
//  PetID
//
//  Created by Gabriel Mors  on 06/11/23.
//

import UIKit

struct User: Codable {
    var userID: String
    var name: String
    var email: String
    var profileImage: Data?
}
