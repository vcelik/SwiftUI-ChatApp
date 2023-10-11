//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Volkan Celik on 03/07/2023.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
