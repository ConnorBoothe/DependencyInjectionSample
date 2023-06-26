//
//  ViewModelRegistry.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/22/23.
//

import Foundation

//This is required to allow this DI method to play nicely with ObservableObjects
class ViewModelResolver<T: ObservableObject> {
    //This might need to be changed to accept a type
    public static func resolve(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        return InjectedValues[keyPath]
    }
}
