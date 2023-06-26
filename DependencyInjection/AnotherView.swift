//
//  AnotherView.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/26/23.
//

import SwiftUI

struct AnotherView<ViewModel: ViewModelSvc>: View {
    @StateObject var viewModel: ViewModel
    var body: some View {
        Text("This is another view")
            .onAppear {
                Task {
                    await viewModel.getUser()
                    await viewModel.getPhoto()
                }
            }
    }
}
