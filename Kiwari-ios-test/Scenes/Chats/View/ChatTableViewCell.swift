//
//  ChatTableViewCell.swift
//  Kiwari-ios-test
//
//  Created by daniel on 09/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var chatTableView: ChatTableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setup(chat: Chat) {
        message.text = chat.message
        chatTableView.currentUserIsSender = chat.email == UserStorage.getUser()?.email
        
    }
    
    
    
}
