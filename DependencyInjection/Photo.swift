//
//  Photo.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/22/23.
//

import Foundation

class Photo: FirestoreObject {
    let documentID: String?
    let url: String
    
    init(
        documentID: String? = nil,
        url: String
    ){
        self.documentID = documentID
        self.url = url
    }
    
    func getCollectionName() -> String {
        return "Photo"
    }
}
