//
//  ChatsWorker.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright (c) 2020 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ChatsWorker
{
    func getCollection(completion: @escaping (_ chats: [Chat]?) -> ()) {
        
        FirebaseConstans.refs.databaseChats.addSnapshotListener { documentSnapshot, error in
                   if let snapshot = documentSnapshot {
                    var chats = [[String : Any]]()
                       for doc in snapshot.documents {
                        chats.append(doc.data())
                   }
                    print(chats)
           }
       }
       }
}