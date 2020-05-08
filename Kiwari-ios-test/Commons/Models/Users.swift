//
//  Users.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation


protocol User {
    var name: String {get}
    var avatar : String {get}
    var email : String {get}
    var password: String {get}
}

struct User1 : User {
    var name: String = "Jarjit Singh"
    
    var avatar: String = "https://api.adorable.io/avatars/160/jarjit@mail.com.png"
    
    var email: String = "jarjit@mail.com"
    
    var password: String = "123456"
}

struct User2 : User {
    var name: String = "Ismail bin Mail"
    
    var avatar: String = "https://api.adorable.io/avatars/160/ismail@mail.com.png"
    
    var email: String = "ismail@mail.com"
    
    var password: String = "123456"
    
}
