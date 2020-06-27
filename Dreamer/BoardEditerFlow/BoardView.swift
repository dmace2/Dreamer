//
//  BoardView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/27/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var viewModel = BoardViewModel()
    
    var board: Board
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            viewModel.deleteData(boardName: board.boardName, postName: viewModel.posts[index].postName)
        }
        //users.remove(atOffsets: offsets)
        print("deleting")
    }
    
    var body: some View {
        VStack(spacing: 18) {
            NavigationLink(destination: BoardPostBuilderView(title: "", text: "", color: UIColor.red, boardName: self.board.boardName, postName: "")) {
                
                Image(systemName: "plus.app")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    
                    .font(.system(size: 28, weight: .bold))
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                
            }
//            List(viewModel.posts, id: \.postName) { post in
//                NavigationLink(destination: BoardPostBuilderView(title: post.title, text: post.text, color: UIColor(red: CGFloat(post.color[0]), green: CGFloat(post.color[1]), blue: CGFloat(post.color[2]), alpha: 1), boardName: self.board.boardName, postName: post.postName)) {
//                    VStack(alignment: .leading) {
//                        Text(post.title)
//                            .font(.title)
//                            .padding(.horizontal, 5)
//                        Text("Last Edited: \(post.timeStamp)")
//                            .font(.subheadline)
//                            .padding(.horizontal, 5)
//                        Text(post.text)
//                            .font(.body)
//                            .padding(.horizontal, 5)
//                            .lineLimit(5)
//                    }
//                }
//                .padding(.vertical, 32)
//                .padding(.horizontal, 20)
//                .background(Color(red: post.color[0], green: post.color[1], blue: post.color[2]))
//                .cornerRadius(5)
//                .shadow(color: Color(.secondaryLabel), radius: 5)
//            }
            List {
                ForEach(viewModel.posts, id: \.postName) { post in
                    NavigationLink(destination: BoardPostBuilderView(title: post.title, text: post.text, color: UIColor(red: CGFloat(post.color[0]), green: CGFloat(post.color[1]), blue: CGFloat(post.color[2]), alpha: 1), boardName: self.board.boardName, postName: post.postName)) {
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.title)
                                .padding(.horizontal, 5)
                            Text("Last Edited: \(post.timeStamp)")
                                .font(.subheadline)
                                .padding(.horizontal, 5)
                            Text(post.text)
                                .font(.body)
                                .padding(.horizontal, 5)
                                .lineLimit(5)
                        }
                    }
                    .padding(.vertical, 32)
                    .padding(.horizontal, 20)
                    .background(Color(red: post.color[0], green: post.color[1], blue: post.color[2]))
                    .cornerRadius(5)
                    .shadow(color: Color(.secondaryLabel), radius: 5)
                }
                .onDelete(perform: delete)
            }
                
            .onAppear() {
                UITableView.appearance().separatorStyle = .none
                self.viewModel.fetchData(boardName: self.board.boardName)
            }
        }
        .padding(.horizontal, 32)
        .navigationBarTitle(board.title)
        
    }
}

//struct BoardPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardPickerView()
//    }
//}
