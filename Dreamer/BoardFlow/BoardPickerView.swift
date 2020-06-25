//
//  BoardPickerView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI



let testData = [
    Board(title: "Board #1", text: "Lorem Ipsum", color: [1,0,0], timeStamp: Date.init()),
    Board(title: "Board #2", text: "Lorem Ipsum", color: [0,1,0], timeStamp: Date.init())
]


struct BoardPickerView: View {
    //@Binding var showMenu: Bool
    @ObservedObject var viewModel = BoardPickerViewModel()
    
    
    var body: some View {
        VStack(spacing: 18) {
            NavigationLink(destination: BoardBuilder(title: "", text: "")) {
                
                Image(systemName: "plus.app")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    
                    .font(.system(size: 14, weight: .bold))
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(5)
                
            }
            List(viewModel.boards) { board in
                NavigationLink(destination: BoardBuilder(title: board.title, text: board.text)) {
                    VStack(alignment: .leading) {
                        Text(board.title)
                            .font(.headline)
                            .padding(.horizontal, 5)
                        Text(board.text)
                            .font(.subheadline)
                            .padding(.horizontal, 5)
                        Text("Last Edited: \(board.timeStamp)")
                            .font(.subheadline)
                            .padding(.horizontal, 5)
                    }
                }
                .padding(.vertical, 32)
                //.background(Color(red: board.color[0], green: board.color[1], blue: board.color[2]))
            }
            .onAppear() {
                UITableView.appearance().separatorStyle = .none
                self.viewModel.fetchData()
            }
        }
        .padding(.horizontal, 32)
        .navigationBarTitle("Boards")
        
    }
}

//struct BoardPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardPickerView()
//    }
//}
