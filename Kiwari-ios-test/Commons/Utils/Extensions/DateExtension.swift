//
//  DateExtension.swift
//  Kiwari-ios-test
//
//  Created by daniel on 11/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

extension Date {
    
    func toStringFormat(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "id_ID")
        return formatter.string(from: self)
    }
}
