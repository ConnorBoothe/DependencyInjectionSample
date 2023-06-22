//
//  EntityManager.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation
import FirebaseFirestore

class EntityManager<T: FirestoreObject> {
    func decode(_ fields: [String: Any]) throws -> T? {
        let decoder = JSONDecoder()
        let jsonData = try? JSONSerialization.data(withJSONObject: fields)
        if let data = jsonData {
            return try decoder.decode(T.self, from: data)
        } else {
            return nil
        }
    }
    
    func encode(_ entity: T) -> [String : Any]? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entity)
            return try JSONSerialization.jsonObject(with: data) as? [String : Any]
        } catch(let error) {
            debugPrint("Error encoding object of type \(T.self). Error message: \(error)")
        }
        return nil
    }
}
