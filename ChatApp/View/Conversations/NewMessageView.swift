//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Volkan Celik on 07/07/2023.
//

import SwiftUI

struct NewMessageView: View {
    
    @Binding var showChatView:Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText=""
    @State private var isEditing=false
    @Binding var user:User?
    @ObservedObject var viewModel=NewMessageViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText,isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack(alignment:.leading){
                ForEach((viewModel.users)){user in
                    Button {
                        showChatView.toggle()
                        self.user=user
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell(user: user)
                    }

                }
            }
        }
    }
}


