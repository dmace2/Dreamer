//
//  LoginView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/16/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: LoginModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isSignedIn {
                    BoardListView()
                        .navigationTitle("Content")
                } else {
                    SignInView()
                }
            }
        }
        
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn //computed property
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginModel())
    }
}
