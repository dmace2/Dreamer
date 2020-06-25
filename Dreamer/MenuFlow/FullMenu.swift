//
//  FullMenu.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/30/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//


import SwiftUI
import UIKit

struct FullMenu: View {
    var user: User
    @State var menuFinishedClosing: Int? = -1
    
    
    var body: some View {
        VStack {
            VStack {
                Image("SampleAvatar")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text(user.displayName ?? "User")
                    .font(.system(size: 28, weight: .heavy))
                    .foregroundColor(Color(.white))
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 20)
            
            NavigationLink(destination: SignInView(), tag: 0, selection: $menuFinishedClosing) {
                Row(rowActive: true, icon: "house", text: "Dashboard")
                    .onTapGesture {
                        print(self.menuFinishedClosing)
                        //self.open.toggle()
                        self.menuFinishedClosing = 0
                }
            }
            .navigationBarBackButtonHidden(true)
            NavigationLink(destination: SignUpView(), tag: 1, selection: $menuFinishedClosing) {
                Row(rowActive: false, icon: "gear", text: "Settings")
                    .onTapGesture {
                        print(self.menuFinishedClosing)
                        //self.open.toggle()
                        self.menuFinishedClosing = 1
                }
            }
            
            Spacer()
            
            Row(rowActive: false, icon: "arrow.uturn.left", text: "Sign Out")
        }
        .padding(.vertical, 20)
        .background(LinearGradient(gradient: Gradient(colors: [Color("Gold"), Color("Navy")]), startPoint: .bottom, endPoint: .top))
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct FullMenu_Previews: PreviewProvider {
    static var previews: some View {
        FullMenu(user: User(uid: "1234", email: nil, displayName: "Dylan Mace", avatar: nil))
    }
}
