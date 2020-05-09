//
//  UserStorage.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

class UserStorage {
    
    class func saveUser(user: User) {
        let keychainService = AppState.sharedInstance.keychainManager
        keychainService.saveObjectWithKey(object: user, key: LocalStorageKey.userProfile.rawValue)
    }
    
    class func getUser() -> User? {
        let keychainService = AppState.sharedInstance.keychainManager
        return keychainService.getObjectWithKey(key: LocalStorageKey.userProfile.rawValue, objectType: User.self)
    }
    
    class func removeUser() {
        let keychainService = AppState.sharedInstance.keychainManager
        keychainService.removeKey(key: LocalStorageKey.userProfile.rawValue)
    }
    
    class func saveFireListener(state: Bool) {
        let keychainService = AppState.sharedInstance.keychainManager
        keychainService.saveObjectWithKey(object: state, key: LocalStorageKey.fireListener.rawValue)
    }
    
    class func getFireListener() -> Bool {
        let keychainService = AppState.sharedInstance.keychainManager
        return keychainService.getObjectWithKey(key: LocalStorageKey.fireListener.rawValue, objectType: Bool.self) ?? false
    }
    
    class func removeFireListener() {
        let keychainService = AppState.sharedInstance.keychainManager
        keychainService.removeKey(key: LocalStorageKey.fireListener.rawValue)
    }
}
