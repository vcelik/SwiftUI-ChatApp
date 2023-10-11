//
//  StatusSelectorView.swift
//  ChatApp
//
//  Created by Volkan Celik on 07/07/2023.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel=StatusViewModel()
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment:.leading){
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    //status cell
                    StatusCell(status: viewModel.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    //FOR LOOP WİTH OPTİONS
                    ForEach(UserStatus.allCases.filter({$0 != .notConfigured}),id:\.self){status in
                        Button {
                            viewModel.updateStatus(status)
                        } label: {
                            StatusCell(status: status)
                        }

                    }
                }

            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}


struct StatusCell: View {
    let status:UserStatus
    var body: some View {
        HStack{
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
