//
//  ConversationCellViewModel.swift
//  ChatApp
//
//  Created by Volkan Celik on 24/08/2023.
//

import SwiftUI

class ConversationCellViewModel:ObservableObject{
    @Published var message:Message
    
    init(_ message:Message){
        self.message=message
        fetchUser()
    }
    
    var chatPartnerId:String{
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl:URL?{
        guard let user=message.user else {return nil}
        return URL(string: user.profileImageurl)
    }
    
    var fullname:String{
        guard let user=message.user else {return ""}
        return user.fullname
    }
    
    func fetchUser(){
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            //guard let data=snapshot?.data() else {return}
            self.message.user=try? snapshot?.data(as: User.self)
        }
        
    }
}
