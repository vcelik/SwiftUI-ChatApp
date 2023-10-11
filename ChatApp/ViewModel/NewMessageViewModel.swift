//
//  NewMessageViewModel.swift
//  ChatApp
//
//  Created by Volkan Celik on 09/07/2023.
//

import SwiftUI
import Firebase

class NewMessageViewModel:ObservableObject{
    @Published var users=[User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents=snapshot?.documents else {return}
            self.users=documents.compactMap({ try? $0.data(as: User.self)}).filter({$0.id != AuthViewModel.shared.userSession?.uid})
            print(self.users)
        }
    }
}


