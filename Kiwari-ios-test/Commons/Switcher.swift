//
//  Switcher.swift
//  Kiwari-ios-test
//
//  Created by daniel on 11/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let status = AppState.sharedInstance.isLoggedIn()
        var rootVC : UIViewController?
        UserStorage.saveFireListener(state: false)
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatsViewController") as! ChatsViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
        
        let window = UIApplication.shared.windows
            .first
        
        let transition = CATransition()

        transition.type = .reveal
        transition.subtype = .fromBottom
        transition.duration = 0.2

        window?.layer.add(transition, forKey: kCATransition)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        
    }
    
}
