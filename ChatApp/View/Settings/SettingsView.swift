//
//  SettingsView.swift
//  ChatApp
//
//  Created by Volkan Celik on 06/07/2023.
//

import SwiftUI

struct SettingsView: View {
    private let user:User
    @EnvironmentObject var authViewModel:AuthViewModel
    
    init(user:User){
        self.user=user
    }
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing:32){
                NavigationLink {
                    EditProfileView()
                } label: {
                    SettingsHeaderView(user:user)
                }

                VStack(spacing:1) {
                    ForEach(SettingsCellViewModel.allCases,id:\.self){ viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button {
                    AuthViewModel.shared.signout()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16,weight: .semibold))
                        .frame(width:UIScreen.main.bounds.width,height: 50)
                        .background(Color.white)
                }

                Spacer()
            }

        }
    }
}




