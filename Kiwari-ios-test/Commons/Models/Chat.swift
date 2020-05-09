//
//  Chat.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation
import Firebase

struct Chat {
    var name: String?
    var email: String?
    var avatar: String?
    var time: Timestamp?
    var message: String?
    
    init(doc: [String: Any]){
        self.name = doc["name"] as? String
        self.email = doc["email"] as? String
        self.avatar = doc["avatar"] as? String
        self.time = doc["time"] as? Timestamp
        self.message = doc["message"] as? String
    }
}
