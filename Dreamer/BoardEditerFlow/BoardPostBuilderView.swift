//
//  BoardPostBuilderView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/27/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI
import ColorPicker

struct BoardPostBuilderView: View {
    @ObservedObject var viewModel = BoardViewModel()
    @State var title: String
    @State var text: String
    @State var color: UIColor
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var boardName: String
    var postName: String
    
    func saveData() {
        if (postName == "") {
            self.viewModel.createPost(boardName: self.boardName, title: title, text: text, color: color)
        } else {
            self.viewModel.saveData(boardName: self.boardName, postName: self.postName, title: title, text: text, color: color)
        }
        self.presentationMode.wrappedValue.dismiss()
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
            ColorPicker(color: $color, strokeWidth: 30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 200)
                .shadow(color: Color(.secondaryLabel), radius: 5)
            Spacer()
            Button(action: saveData) {
                Text("Save Post")
                    
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    
                    .font(.system(size: 14, weight: .bold))
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(5)
            }
        }
        .padding(32)
        .navigationBarTitle("Edit Post")
    }
}

//struct BoardPostBuilderView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardPostBuilderView()
//    }
//}
