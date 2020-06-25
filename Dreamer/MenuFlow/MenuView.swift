//
//  MenuView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack() {
                MenuRow(icon: "house", text: "Dashboard")
                MenuRow(icon: "gear", text: "Settings")
            }
            Spacer()
        }
        .padding(.top, 100)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .opacity(1)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
