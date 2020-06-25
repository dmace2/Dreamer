//
//  MenuRow.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct MenuRow: View {
    //var rowActive: Bool
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(.white))
                .font(.system(size: 20, weight: .regular))
                .frame(width: 48, height: 32)
            
            Text(text)
                .foregroundColor(Color(.white))
                .font(.system(size: 15, weight: .regular))
            
            Spacer()
        }
        .padding(.top, 30)
        .background(Color(.white).opacity(0))
        .padding(.trailing, 5)
        .padding(.leading, 5)
        .cornerRadius(10)
        //.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}



struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(icon: "house", text: "Dashboard")
    }
}
