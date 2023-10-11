//
//  ContentView.swift
//  ChatApp
//
//  Created by Volkan Celik on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                MainTabView()
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
