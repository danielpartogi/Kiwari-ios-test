//
//  AppState.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//
import Foundation

class AppState: NSObject {
  
  static let sharedInstance = AppState()
    lazy var keychainManager: KeychainManager = {
       let keychainManager = KeychainManager()
       return keychainManager
     }()
     
  
  func setupAuthorizedState(user: User) {
    UserStorage.saveUser(user: user)
  }
  
  func setupUnauthorizedState() {
    UserStorage.removeUser()
  }

    func isFirstListener() -> Bool {
        return UserStorage.getFireListener()
    }
  
  func isLoggedIn() -> Bool {
    var loggedIn = false
    if let _ = UserStorage.getUser() {
      loggedIn = true
    }
    return loggedIn
  }
}
