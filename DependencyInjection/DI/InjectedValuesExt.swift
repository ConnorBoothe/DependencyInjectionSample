//
//  InjectedValuesExt.swift
//  DependencyInjection
//
//  Created by Connor Boothe on 6/21/23.
//

import Foundation
import SwiftUI

extension InjectedValues {
    //add provider key for each dependency
    private class UserApiProviderKey: InjectionKey {
        static var currentValue: Api<User> = Api<User>()
    }
    
    var userApi: Api<User>{
        get { UserApiProviderKey.currentValue }
        set { UserApiProviderKey.currentValue = newValue }
    }
    
    //add provider key for each dependency
    private class PhotoApiProviderKey: InjectionKey {
        static var currentValue: Api<Photo> = Api<Photo>()
    }
    
    var photoApi: Api<Photo>{
        get { PhotoApiProviderKey.currentValue }
        set { PhotoApiProviderKey.currentValue = newValue }
    }
    
    //add provider key for each dependency
    private class RepoProviderKey: InjectionKey {
        //Repo() can be swapped out with any class conforming to Repository
        static var currentValue: Repository = Repo()
    }
    
    var repo: Repository {
        get { RepoProviderKey.currentValue }
        set { RepoProviderKey.currentValue = newValue }
    }
    
    //add provider key for each dependency
    private class ViewModelProviderKey: InjectionKey {
        static var currentValue: MockViewModel = MockViewModel()
    }
    var viewModel: MockViewModel {
        get { ViewModelProviderKey.currentValue }
        set { ViewModelProviderKey.currentValue =  newValue }
    }

}
