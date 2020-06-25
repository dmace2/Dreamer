//
//  BoardBuilder.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct BoardBuilder: View {
    @State var title: String
    @State var text: String
    
    func saveData() {
        print("saved")
    }
    
    var body: some View {
        VStack(spacing: 18) {
            TextField("Title", text: $title)
                .font(.title)
                .keyboardType(.emailAddress)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
            TextView(text: $text)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
            Spacer()
            Button(action: saveData) {
                Text("Save Message")
                    
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    
                    .font(.system(size: 14, weight: .bold))
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(5)
            }
        }
        .padding(32)
        .navigationBarTitle("Edit Message")
    }
}

//struct BoardBuilder_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardBuilder()
//    }
//}
