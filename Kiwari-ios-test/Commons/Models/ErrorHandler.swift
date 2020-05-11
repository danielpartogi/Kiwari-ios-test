//
//  ErrorHandler.swift
//  Kiwari-ios-test
//
//  Created by daniel on 11/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

struct ErrorHandler : Error {
    let description : String
    let domain : String
    
    var localizedDescription: String {
        return NSLocalizedString(description, comment: "")
    }
}
