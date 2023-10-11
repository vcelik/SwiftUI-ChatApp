//
//  UserCell.swift
//  ChatApp
//
//  Created by Volkan Celik on 07/07/2023.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user:User
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string: user.profileImageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width:48,height:48)
                    .clipShape(Circle())
                VStack(alignment:.leading,spacing:4){
                    Text(user.username)
                        .font(.system(size: 14,weight: .semibold))
                    Text(user.fullname)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}


