//
//  NavigationChat.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

@IBDesignable
class NavigationBarChatView: UIView {
    
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed("NavigationBarChat", owner: self, options: nil)
        addSubview(view)
        
    }
    
    func setupView(user: User) {
        guard let urlImage = URL(string: user.avatar) else {return}
        userImage.layer.cornerRadius = 16
        userImage.clipsToBounds = true
        userName.text = user.name
        UIImage.loadFrom(url: urlImage) { image in
            self.userImage?.image = image
        }
    }
}
