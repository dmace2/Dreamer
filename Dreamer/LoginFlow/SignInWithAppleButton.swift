//
//  SignInWithAppleButton.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    //@Binding var name : String
    
    func makeCoordinator() -> AppleCoordinator {
        return AppleCoordinator(self)
    }
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        
        button.addTarget(context.coordinator, action:  #selector(AppleCoordinator.didTapButton), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    
    }
}

fileprivate struct SignInWithAppleButtonInternal: UIViewRepresentable { // (3)
    var colorScheme: ColorScheme
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        switch colorScheme {
        case .light:
            let signInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
            signInButton.addTarget(context.coordinator, action:  #selector(AppleCoordinator.didTapButton), for: .touchUpInside)
            return signInButton
        case .dark:
            let signInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
            signInButton.addTarget(context.coordinator, action:  #selector(AppleCoordinator.didTapButton), for: .touchUpInside)
            return signInButton
        @unknown default:
            let signInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
            signInButton.addTarget(context.coordinator, action:  #selector(AppleCoordinator.didTapButton), for: .touchUpInside)
            return signInButton
        }
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}

struct SignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButton()
    }
}

class UserSettings: ObservableObject {
// 1 = Authorized, -1 = Revoked
@Published var authorization: Int = 0
}
