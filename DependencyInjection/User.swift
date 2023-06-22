//
//  User.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation

class User: FirestoreObject {
    let documentID: String?
    let name: String
    
    init(
        documentID: String? = nil,
        name: String
    ){
        self.documentID = documentID
        self.name = name
    }
    
    func getCollectionName() -> String {
        return "User"
    }
}
