//
//  ContentView.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
        print("User: \(String(describing: session.session))")
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                NavigationView {
                    BoardPickerView()
                }
                
            } else {
                AuthView()
            }
        }
        .onAppear(perform: getUser)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
