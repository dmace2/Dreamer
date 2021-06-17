//
//  BoardContentView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/16/21.
//

import SwiftUI

struct BoardContentView: View {
    var board: Board
    
    init(_ board: Board) {
        self.board = board
    }
    
    var body: some View {
        VStack {
            Text("Test")
        }
        .navigationTitle(board.name)
    }
}

//struct BoardContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardContentView()
//    }
//}
