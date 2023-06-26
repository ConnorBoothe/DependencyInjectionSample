//
//  UserViewModel.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation

class ViewModel: ViewModelSvc {
    @Injected(\.repo) var repo: RepositorySvc
    @Published var user: User?
    var id = UUID()
    
    func getUser() async {
        print("Get user real vm")
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
    
    func initialize() {
        print("init")
    }
}
