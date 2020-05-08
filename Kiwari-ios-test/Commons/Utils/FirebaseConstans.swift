//
//  FirebaseConstans.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Firebase

struct FirebaseConstans
{
    struct refs
    {
        static let databaseRoot = Firestore.firestore()
        static let databaseChats = databaseRoot.collection("chats")
    }
}
