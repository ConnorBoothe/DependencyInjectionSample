//
//  Injected.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation
import SwiftUI

@propertyWrapper
class Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }

    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}

