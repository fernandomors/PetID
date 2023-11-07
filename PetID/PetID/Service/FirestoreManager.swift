//
//  FirestoreManager.swift
//  PetID
//
//  Created by Gabriel Mors  on 06/11/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case userNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorURLRequest(Swift.Error)
    case errorUrl(urlString: String)
    case errorDetail(detail: String)
}

fileprivate enum CollectionKeys: String {
    case user = "user"
}

class FirestoreManager {
    
    static let shared = FirestoreManager()
    
    private let firestore: Firestore
    
    private init() {
        firestore = Firestore.firestore()
    }
    
    public func createUser(name: String, email: String, completion: @escaping (Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(NSError(domain: "FirestoreManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"]) as? Error)
            return
        }
        let user = User(userID: userId, name: name, email: email)
        let userCollection = firestore.collection(CollectionKeys.user.rawValue)
        do {
            try userCollection.document(userId).setData(from: user)
            completion(nil)
        } catch let error {
            completion(error as? Error)
        }
    }
    
//    func getObjectData<T: Codable>(collection: String, forObjectType objectType: T.Type, completion: @escaping (Result<T, Swift.Error>) -> Void) {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {
//            completion(.failure(NSError(domain: "FirestoreManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Usuário não autenticado"]) as? Error ?? Error.fileNotFound(name: "Documento não existe")))
//            return
//        }
//        
//        firestore.collection(collection).document(currentUserID).getDocument { document, error in
//            
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let document = document, document.exists else {
//                completion(.failure(NSError(domain: "FirestoreManager", code: -2, userInfo: [NSLocalizedDescriptionKey: "Documento não existe ou houve um erro"])))
//                return
//            }
//            
//            do {
//                let object = try document.data(as: T.self)
//                completion(.success(object))
//            } catch let error {
//                completion(.failure(error))
//            }
//        }
//    }
}
