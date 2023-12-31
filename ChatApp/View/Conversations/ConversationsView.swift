//
//  ConversationsView.swift
//  ChatApp
//
//  Created by Volkan Celik on 06/07/2023.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView=false
    @State private var showChatView=false
    @State var selectedUser:User?
    @ObservedObject var viewModel=ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            if let user=selectedUser{
                NavigationLink(destination: ChatView(user: user), isActive: $showChatView) {}
            }
            
            ScrollView{
                VStack(alignment:.leading){
                    ForEach((viewModel.recentMessages)){message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            //floating button
            Button {
                showNewMessageView.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width:24,height:24)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView) {
                NewMessageView(showChatView: $showChatView,user: $selectedUser)
            }

        }
        .onAppear{
            viewModel.fetchRecentMessages()
        }
        

    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
