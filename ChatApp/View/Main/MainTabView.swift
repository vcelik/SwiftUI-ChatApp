//
//  MainTabView.swift
//  ChatApp
//
//  Created by Volkan Celik on 06/07/2023.
//

import SwiftUI
import Firebase

struct MainTabView: View {
    @State private var selectedIndex=0
    @EnvironmentObject var viewModel:AuthViewModel

    var body: some View {
        if let user=viewModel.currentUser{
            NavigationView{
                //tabview
                TabView(selection:$selectedIndex){
                    ConversationsView()
                        .onTapGesture {
                            selectedIndex=0
                        }
                        .tabItem {
                            Image(systemName: "bubble.left")
                        }
                        .tag(0)
                    ChannelsView()
                        .onTapGesture {
                            selectedIndex=1
                        }
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right")
                        }
                        .tag(1)
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex=2
                        }
                        .tabItem {
                            Image(systemName: "gear")
                        }
                        .tag(2)
                }
                .navigationTitle(tabTitle)
                
                //each view for tab like channel chats and settings
            }
        }
        


    }

    
    var tabTitle:String{
        switch selectedIndex{
        case 0:return "Chats"
        case 1:return "Channels"
        case 2:return "Settings"
        default:return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(AuthViewModel())
    }
}
