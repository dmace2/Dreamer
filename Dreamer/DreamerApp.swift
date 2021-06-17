//
//  DreamerApp.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/16/21.
//

import SwiftUI
import Firebase

@main
struct DreamerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        let loginModel = LoginModel()
        
        WindowGroup {
            LoginView().environmentObject(loginModel)
            
        }
    }
}
