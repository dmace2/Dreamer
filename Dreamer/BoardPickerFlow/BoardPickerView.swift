//
//  BoardPickerView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct BoardPickerView: View {
    //@Binding var showMenu: Bool
    @ObservedObject var viewModel = BoardPickerViewModel()
    
    
    var body: some View {
        VStack(spacing: 18) {
            NavigationLink(destination: BoardBuilderView(title: "", text: "")) {
                
                Image(systemName: "plus.app")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    
                    .font(.system(size: 28, weight: .bold))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                
            }
            List(viewModel.boards, id: \.boardName) { board in
//                NavigationLink(destination: BoardBuilder(title: board.title, text: "foo")) {
                NavigationLink(destination: BoardView(board: board)) {
                    VStack(alignment: .leading) {
                        Text(board.title)
                            .font(.title)
                            .padding(.horizontal, 5)
                        Text("Last Edited: \(board.timeStamp)")
                            .font(.subheadline)
                            .padding(.horizontal, 5)
                    }
                }
                .padding(.vertical, 32)
                .padding(.horizontal, 20)
                .background(Color(red: board.color[0], green: board.color[1], blue: board.color[2]))
                .cornerRadius(5)
                .shadow(color: Color(.secondaryLabel), radius: 5)
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
