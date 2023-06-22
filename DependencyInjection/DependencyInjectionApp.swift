//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import SwiftUI
import FirebaseCore
@main
struct DependencyInjectionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
    return true
  }
}
