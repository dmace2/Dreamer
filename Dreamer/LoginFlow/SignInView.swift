//
//  SignInView.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct SignInView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn () {
        session.signIn(email: email, password: password) { (result , error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(Color("Gold"))
            Text("Sign in to continue")
                .font(.system(size: 18))
            
            VStack(spacing: 18) {
                TextField("Email Address", text: $email)
                    .font(.system(size: 14))
                    .keyboardType(.emailAddress)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
                SecureField("Password", text: $password)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
            }
            .padding(.vertical, 64)
            
            Button(action: signIn) {
                Text("Sign In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(Color(.white))
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Gold"), Color("Navy")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
            }
            
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemRed))
                .padding()
            }
            
            Spacer()
            
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(.label))
                    Text("Create One Here!")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("Gold"))
                }
            }
        }
        .padding(.horizontal, 32)
        
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
