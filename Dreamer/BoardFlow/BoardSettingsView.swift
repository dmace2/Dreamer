//
//  BoardSettingsView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/17/21.
//

import SwiftUI

struct BoardSettingsView: View {
    var board: Board
    @State var textNameField: String = ""
    
    init(_ board: Board) {
        self.board = board
        textNameField = board.name
    }
    
    var body: some View {
        
        List {
            Section(header: Text("Board Information")) {
                VStack(alignment: .center) {
                    Image(systemName: "note.text")
                        .resizable().scaledToFit()
                        .padding()
                        .frame(width: 100)
                }
                TextField("Board Name:", text: $textNameField)
            }
        }
        .navigationTitle("Board Settings")
    }
}

struct BoardSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        BoardSettingsView(Board(id: "12345", name: "Test", color: .red, users: [], lastEdited: Date()))
    }
}
