//
//  CreateBoard.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/27/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI
import ColorPicker
import FirebaseFirestore

struct BoardBuilderView: View {
    @ObservedObject var viewModel = BoardPickerViewModel()
    @State var title: String
    @State var text: String
    @State var color = UIColor.red
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveData(title: String, color: UIColor) -> () -> () {
        return {
            self.viewModel.saveData(title: title, color: color)
            self.dismissView()
        }
    }
    
    func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack(spacing: 18) {
            TextField("Title", text: $title)
                .font(.title)
                .keyboardType(.emailAddress)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.secondaryLabel), lineWidth: 1))
            Text("Select a Color:")
            ColorPicker(color: $color, strokeWidth: 30)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 200)
                .shadow(color: Color(.secondaryLabel), radius: 5)
            Spacer()
            VStack(spacing: 18) {
                Button(action: saveData(title: title, color: color)) {
                    Text("Save Board")
                        
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        
                        .font(.system(size: 14, weight: .bold))
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                }
                Button(action: dismissView) {
                    Text("Discard Board")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(Color(.systemRed))
                        .font(.system(size: 14, weight: .bold))
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                }
            }
        }
        .padding(32)
        .navigationBarTitle("Create New Board")
    }
}

//struct CreateBoard_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateBoard()
//    }
//}
