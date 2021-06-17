//
//  LoginModel.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/16/21.
//

import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore

class LoginModel: ObservableObject {
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        auth.currentUser != nil
    }
    
    func signIn(email: String, password:String, completion: @escaping (Error?) -> Void) {
        auth.signIn(withEmail: email, password: password, completion: {result, error in
            guard result != nil, error == nil else {
                completion(error)
                return
            }
            print("success")
            DispatchQueue.main.async {
                self.createUserData()
                withAnimation {
                    self.signedIn = true
                }
            }
        })
    }
    
    func signIn(with credential: OAuthCredential, completion: @escaping (Error?) -> Void) {
        auth.signIn(with: credential) { (authResult, error) in
            if (error != nil) {
                completion(error)
                return
            }
            DispatchQueue.main.async {
                self.createUserData()
                withAnimation {
                    self.signedIn = true
                }
            }
        }
    }
    
    func signUp(email: String, password:String, completion: @escaping (Error?) -> Void) {
        auth.createUser(withEmail: email, password: password, completion: {result, error in
            if (error != nil) {
                completion(error)
                return
            }
            DispatchQueue.main.async {
                self.createUserData()
                withAnimation {
                    self.signedIn = true
                }
            }
        })
    }
    
    func signOut() {
        try? auth.signOut()
        withAnimation {
            self.signedIn = false
        }
    }
    
    func createUserData() {
        if let user = auth.currentUser {
            db.collection("users").document(user.uid).setData([
                "name": user.displayName ?? "Unknown Name",
                "email": user.email ?? "unknown@unknown.com",
            ], merge: true) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        } else {
        }
    }
    
}
