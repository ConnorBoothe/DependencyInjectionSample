//
//  ApiSvc.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/26/23.
//

import Foundation
import FirebaseFirestore

protocol ApiSvc {
    associatedtype T
    func query(_ collectionName: String, filter: Filter) async -> [T]?
}
