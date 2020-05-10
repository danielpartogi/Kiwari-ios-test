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
    
    enum type {
        case dictionary
        case data
    }
    
    var name: String?
    var email: String?
    var avatar: String?
    var time: Date?
    var message: String?
    
    init(doc: [String: Any]){
        self.name = doc["name"] as? String
        self.email = doc["email"] as? String
        self.avatar = doc["avatar"] as? String
        self.message = doc["message"] as? String
        
        let date = doc["time"] as? Timestamp
        self.time = date?.dateValue()
    }
    
    init(name: String, email:String, avatar: String, time:Date, message: String) {
        self.name = name
        self.email = email
        self.avatar = avatar
        self.time = time
        self.message = message
    }
    
    func getDictionaryData () -> [String:Any?] {
        return [
            "name": self.name,
            "time": Timestamp(date: self.time ?? Date()),
            "email": self.email,
            "avatar": self.avatar,
            "message": self.message,
        ]
    }
}
