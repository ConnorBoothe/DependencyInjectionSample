//
//  InjectionKey.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation

//Can be modularized
public protocol InjectionKey {

    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value

    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}
