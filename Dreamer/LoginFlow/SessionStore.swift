//
//  SessionStore.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import FirebaseAuth

class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?

    func listen() {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = User(
                    uid: user.uid,
                    email: user.email,
                    displayName: user.displayName ?? "User",
                    avatar: user.photoURL

                )
                print(self.session)
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            print("error signing out")
        }
    }
    
}
