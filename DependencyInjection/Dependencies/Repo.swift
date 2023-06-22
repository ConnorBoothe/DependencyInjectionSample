//
//  Repo.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/22/23.
//

import Foundation
import FirebaseFirestore

class Repo: Repository {
    @Injected(\.userApi) var userApi: Api<User>
    @Injected(\.photoApi) var photoApi: Api<Photo>
    
    func queryUser() async -> [User]? {
        let query = await userApi.query("User", filter: Filter.whereField("name", isEqualTo: "Connor"))
        return query
    }
    
    func queryPhoto() async -> [Photo]? {
        print("GET PHOTO FROM REAL REPO")
        let query = await photoApi.query("Photo", filter: Filter.whereField("url", isEqualTo: "sample"))
        return query
    }
}
