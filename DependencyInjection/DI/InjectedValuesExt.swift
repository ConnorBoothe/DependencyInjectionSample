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
    private class ApiProviderKey: InjectionKey {
        static var currentValue: any ApiSvc = Api<User>()
    }
    
    var apiSvc: any ApiSvc {
        get { ApiProviderKey.currentValue }
        set { ApiProviderKey.currentValue = newValue }
    }
    
    private class UserApiProviderKey: InjectionKey {
        static var currentValue: Api<User> = Api<User>()
    }
    
    var userApi: Api<User> {
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
        static var currentValue: RepositorySvc = MockRepo()
    }
    
    var repo: RepositorySvc {
        get { RepoProviderKey.currentValue }
        set { RepoProviderKey.currentValue = newValue }
    }
    
    //add provider key for each dependency
    private class ViewModelProviderKey: InjectionKey {
        static var currentValue: ViewModel = ViewModel()
    }
    
    var viewModel: ViewModel {
        get { ViewModelProviderKey.currentValue }
        set { ViewModelProviderKey.currentValue = newValue }
    }
    
    //add provider key for each dependency
    private class MockViewModelProviderKey: InjectionKey {
        static var currentValue: MockViewModel = MockViewModel()
    }
    
    var mockViewModel: MockViewModel {
        get { MockViewModelProviderKey.currentValue }
        set { MockViewModelProviderKey.currentValue =  newValue }
    }
    
    //need to be able to switch things out more easily

}
