//
//  Row.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/29/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct Row: View {
    var rowActive: Bool
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(rowActive ? Color("Gold") : Color(.white))
                .font(.system(size: 15, weight: rowActive ? .bold : .regular))
                .frame(width: 48, height: 32)
            
            Text(text)
                .foregroundColor(rowActive ? Color("Gold") : Color(.white))
                .font(.system(size: 15, weight: rowActive ? .bold : .regular))
            
            Spacer()
        }
    .padding(4)
        .background(rowActive ? Color(.white) : Color(.white).opacity(0))
        .padding(.trailing, 5)
        .padding(.leading, 5)
        .cornerRadius(10)
        //.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}



struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(rowActive: true, icon: "house", text: "Dashboard")
    }
}
