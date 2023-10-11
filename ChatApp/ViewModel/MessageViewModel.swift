//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Volkan Celik on 10/07/2023.
//

import Foundation

struct MessageViewModel{
    
    let message:Message
    
    init(_ message:Message){
        self.message=message
    }
    
    
    var currentUid:String{
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser:Bool{
        return message.fromId==currentUid
    }
    
    var profileImageUrl:URL?{
        guard let profileImageUrl=message.user?.profileImageurl else {return nil}
        return URL(string: profileImageUrl)
    }
    
}
