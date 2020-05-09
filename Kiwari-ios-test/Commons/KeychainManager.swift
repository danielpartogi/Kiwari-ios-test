//
//  KeychainManager.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation
import KeychainSwift

protocol Keychain {
  func saveObjectWithKey<T: Codable>(object: T, key: String)
  func getObjectWithKey<T: Codable> (key: String, objectType: T.Type) -> T?
  func removeKey(key: String)
}

class KeychainManager: Keychain {
  
  func getKeychain() -> KeychainSwift {
    let keychain = KeychainSwift(keyPrefix: "kiwari")
    return keychain
  }
  
  func saveObjectWithKey<T: Codable>(object: T, key: String) {
    let keychain = getKeychain()
    if object is String {
      keychain.set(object as! String, forKey: key)
    } else if object is Bool {
      keychain.set(object as! Bool, forKey: key)
    } else {
      let encoder = JSONEncoder()
      let data = try? encoder.encode(object)
      if let data = data {
        keychain.set(data, forKey: key)
      }
    }
  }
  
  func getObjectWithKey<T: Codable> (key: String, objectType: T.Type) -> T? {
    let keychain = getKeychain()
    var resultObject: T?
    if objectType == String.self {
      resultObject = keychain.get(key) as? T
    } else if objectType == Bool.self {
      resultObject = keychain.getBool(key) as? T
    } else {
      let data = keychain.getData(key)
      if let data = data {
        let decoder = JSONDecoder()
        resultObject = try? decoder.decode(objectType, from: data)
      }
    }
    return resultObject
  }
  
  func removeKey(key: String) {
    let keychain = getKeychain()
    keychain.delete(key)
  }
}
