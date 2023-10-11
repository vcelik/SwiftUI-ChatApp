//
//  Message.swift
//  ChatApp
//
//  Created by Volkan Celik on 08/07/2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Message:Identifiable,Decodable{
    @DocumentID var id:String?
    let fromId:String
    let toId:String
    let read:Bool
    let text:String
    let timestamp:Timestamp
    
    var user:User?
    
    
    
}
