//
//  SignUpView.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp () {
        session.signUp(email: email, password: password) { (result , error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
                self.confirmPassword = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Create an Account")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(Color("Gold"))
            Text("Sign up to get started")
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
                SecureField("Confirm Password", text: $confirmPassword)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
            }
            .padding(.vertical, 64)
            
            if (confirmPassword != "" && password != confirmPassword) {
                Text("Passwords do not match")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemRed))
                    .padding()
            }
            
            Button(action: signUp) {
                Text("Create Account")
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
        }
        .padding(.horizontal, 32)
        
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
