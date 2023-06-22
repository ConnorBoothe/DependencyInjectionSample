//
//  Repository.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/22/23.
//

import Foundation

protocol Repository {
    func queryUser() async -> [User]?
    
    func queryPhoto() async -> [Photo]?
}
