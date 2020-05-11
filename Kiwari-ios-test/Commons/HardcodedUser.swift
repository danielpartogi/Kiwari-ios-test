//
//  HarcodedUser.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

class Hardcodeduser {
    static func setHardcodedUser () -> [User] {
        return [User(
            name : "Jarjit Singh",
            avatar : "https://api.adorable.io/avatars/160/jarjit@mail.com.png",
            email : "jarjit@mail.com",
            password : "123456"
            ),  User(
                name : "Ismail bin Mail",
                avatar : "https://api.adorable.io/avatars/160/ismail@mail.com.png",
                email : "ismail@mail.com",
                password : "123456"
            )]
    }
    
    
}
