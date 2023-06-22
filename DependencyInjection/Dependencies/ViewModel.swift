//
//  UserViewModel.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Injected(\.repo) var repo: Repository
    @Published var user: User?
    
    func getUser() async {
        InjectedValues[\.repo] = MockRepo()
        let userQuery = await repo.queryUser()?.first
        print(userQuery?.name as Any)
        DispatchQueue.main.async {
            self.user = userQuery
        }
    }
    
    func getPhoto() async {
        InjectedValues[\.repo] = Repo()
        let photos = await repo.queryPhoto()
        print(photos?.first?.url as Any)
    }
}
