//
//  MockApi.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation
import FirebaseFirestore

class Api<T: FirestoreObject>: ObservableObject {
    let db = Firestore.firestore()
    let entityManager = EntityManager<T>()

    func query(_ collectionName: String, filter: Filter) async -> [T]? {
        do {
            let snapshot = try await db.collection(collectionName)
                .whereFilter(filter).getDocuments()
            let objects: [T] = snapshot.documents.compactMap {
                try? entityManager.decode($0.data())
            }
            return objects
        } catch {
            print("error \(error)")
        }
        return nil
    }
}
