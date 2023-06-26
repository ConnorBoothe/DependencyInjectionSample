//
//  ViewModelSvc.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/26/23.
//

import Foundation

protocol ViewModelSvc: ObservableObject {
    
    var id: UUID { get set }
    var user: User? { get set }
    
    func initialize()
    
    func getUser() async
    
    func getPhoto() async
}
