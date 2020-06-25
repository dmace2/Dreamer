//
//  BoardView.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var session: SessionStore
    @State var open = false
    
    func getData() {
        
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    VStack(spacing: 18) {
                        Text("Hello user!")
                        Button(action: session.signOut) {
                            Text("Sign Out")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 50)
                                .foregroundColor(Color(.white))
                                .font(.system(size: 14, weight: .bold))
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Gold"), Color("Navy")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(5)
                        }
                    }
                    .padding(.horizontal, 32)
                }
                .padding()
                    
                Menu(open: $open, user: session.session!)
            }
            .navigationBarTitle("Board")
            .navigationBarHidden(false)
        .navigationBarItems(leading:
            NavigationLink(destination: FullMenu(user: session.session!)){
                Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundColor(Color(.label))
            })
        }
    .onAppear(perform: getData)
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView().environmentObject(SessionStore())
    }
}
