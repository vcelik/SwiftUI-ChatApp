//
//  User.swift
//  ChatApp
//
//  Created by Volkan Celik on 09/07/2023.
//

import FirebaseFirestoreSwift

struct User:Identifiable,Decodable{
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let email:String
    let profileImageurl:String
}

let MOCK_USER=User(id:"352173527135",username: "Test", fullname: "test", email: "test@gmail.com", profileImageurl: "www.google.com")
