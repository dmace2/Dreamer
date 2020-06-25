//
//  AuthView.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI


struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
