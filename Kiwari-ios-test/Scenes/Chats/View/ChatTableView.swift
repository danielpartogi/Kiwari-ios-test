//
//  ChatTableView.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit


@IBDesignable
class ChatTableView: UIView {
    
    override func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath()
        
        //Draw main body
        bezierPath.move(to: CGPoint(x: rect.minX, y: rect.minY))
        bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-10))
        bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-10))
        bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        
        //Draw the tail
        if currentUserIsSender {
            bezierPath.move(to: CGPoint(x: rect.maxX - 25.0, y: rect.maxY - 10.0))
            bezierPath.addLine(to: CGPoint(x: rect.maxX - 10.0, y: rect.maxY))
            bezierPath.addLine(to: CGPoint(x: rect.maxX - 10.0, y: rect.maxY - 10.0))
            UIColor.green.withAlphaComponent(0.5).setFill()
        } else {
            bezierPath.move(to: CGPoint(x: rect.minX + 25.0, y: rect.maxY - 10.0))
            bezierPath.addLine(to: CGPoint(x: rect.minX + 10.0, y: rect.maxY))
            bezierPath.addLine(to: CGPoint(x: rect.minX + 10.0, y: rect.maxY - 10.0))
            UIColor.lightGray.withAlphaComponent(0.5).setFill()
        }
        
        bezierPath.fill()
        bezierPath.close()
    }
    
    // MARK: Custom Accessors
    
    var currentUserIsSender = true {
        didSet {
            setNeedsDisplay()
        }
    }
}
