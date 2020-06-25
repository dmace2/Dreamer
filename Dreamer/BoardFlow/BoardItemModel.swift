//
//  BoardItemModel.swift
//  Dreamer
//
//  Created by Dylan Mace on 5/30/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BoardItemModel: ObservableObject {
    @Published var items = [BoardItem]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("books").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.items = documents.map { queryDocumentSnapshot -> BoardItem in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let numberOfPages = data["pages"] as? Int ?? 0
                
                return BoardItem()//(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
            }
        }
    }
}
