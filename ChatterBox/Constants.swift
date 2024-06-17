//
//  Constants.swift
//  ChatterBox
//
//  Created by Gautham C on 6/17/24.
//

import Foundation

struct Constants {
    static let appName = "ChatterBox"
    static let loginName = "Login"
    static let registerName = "Register"
    static let nibName = "MessageCellTableViewCell"
    static let nibIdentifier = "ReuseableCell"
    
    struct Segue {
        static let loginToChat = "LoginToChat"
        static let registerToChat = "RegisterToChat"
    }
    
    struct Fstore {
        static let collectionName = "messages"
        static let sender = "sender"
        static let body = "body"
        static let date = "date"
    }
    
    struct Colors {
        static let green = "green"
        static let whiteGreen = "whiteGreen"
        static let slightyDark = "slightyDark"
    }
}
