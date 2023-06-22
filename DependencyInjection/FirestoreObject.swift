//
//  FirestoreObject.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation

protocol FirestoreObject: Codable {
    var documentID: String? { get }
    
    func getCollectionName() -> String
}
