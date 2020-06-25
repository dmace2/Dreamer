//
//  BoardPickerViewModel.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BoardPickerViewModel: ObservableObject {
  @Published var boards = [Board]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("Boards").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.boards = documents.map { queryDocumentSnapshot -> Board in
        let data = queryDocumentSnapshot.data()
        let title = data["title"] as? String ?? ""
        let text = data["text"] as? String ?? ""
        let timeStamp = data["lastEdited"] as? Date ?? Date()
        let color = data["color"] as? [Double] ?? [1,1,1]
        
        

        return Board(title: title, text: text, color: color, timeStamp: timeStamp)
      }
    }
  }
}
