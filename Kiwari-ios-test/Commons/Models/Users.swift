//
//  Users.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation


struct User: Codable {
    var name: String
    
    var avatar: String
    
    var email: String
    
    var password: String
    
    init(isFirstUser: Bool) {
        if isFirstUser {
            name = "Jarjit Singh"
            avatar = "https://api.adorable.io/avatars/160/jarjit@mail.com.png"
            email = "jarjit@mail.com"
            password = "123456"
        } else {
            name = "Ismail bin Mail"
            avatar = "https://api.adorable.io/avatars/160/ismail@mail.com.png"
            email = "ismail@mail.com"
            password = "123456"
        }
    }
}
