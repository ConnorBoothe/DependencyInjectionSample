//
//  ContentView.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    //Concrete types must be instantiated to conform to ObservableObject
    //When passing these dependencies down to child views, we can use ViewModelSvc
    //and pass either of the below view models. I have done this in 'AnotherView'
    @StateObject var viewModel: ViewModel = ViewModelResolver.resolve(\.viewModel)
    @StateObject var mockViewModel: MockViewModel = ViewModelResolver.resolve(\.mockViewModel)

    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Display mock user name from the viewModel below")
                if let user = viewModel.user {
                    Text(user.name)
                }
                Button(action: {
                    path.append(StandardView.another)
                }){
                    Text("Go to another view")
                }
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.getUser()
                    await viewModel.getPhoto()
                }
            }.navigationDestination(for: StandardView.self){ viewType in
                switch(viewType){
                case .home:
                    Text("Home")
                    
                case .another:
                    AnotherView(
                        viewModel: mockViewModel  //viewModel
                    )
                }
            }
        }
        
    }
}

enum StandardView: Hashable {
    case home
    case another
}

