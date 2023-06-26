//
//  MockRepo.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation
import FirebaseFirestore
class MockRepo: RepositorySvc {
    @Injected(\.userApi) var userApi: Api<User>
    @Injected(\.photoApi) var photoApi: Api<Photo>
    
    func queryUser() async -> [User]? {
        print("GET USER FROM MOCK REPO")
        let query = await userApi.query("User", filter: Filter.whereField("name", isEqualTo: "Connor"))
        return query
    }
    
    func queryPhoto() async -> [Photo]? {
        let query = await photoApi.query("Photo", filter: Filter.whereField("url", isEqualTo: "sample"))
        return query
    }
}
