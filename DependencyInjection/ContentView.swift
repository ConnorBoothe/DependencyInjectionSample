//
//  ContentView.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: MockViewModel = ViewModelResolver.resolve(\.viewModel)
    var body: some View {
        VStack {
            Text("Display mock user name from the viewModel below")
            if let user = viewModel.user {
                Text(user.name)
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.getUser()
                await viewModel.getPhoto()
            }
        }
    }
}
