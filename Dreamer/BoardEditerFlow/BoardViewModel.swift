//
//  BoardModel.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/27/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BoardViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private var db = Firestore.firestore()
    
    func fetchData(boardName: String) {
        let boardList = db.collection("boards").document(boardName).collection("posts").order(by: "timestamp", descending: true)
        boardList.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.posts = documents.map { queryDocumentSnapshot -> Post in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? "Title"
                let text = data["text"] as? String ?? "Text"
                let timeStamp = self.formatDate(date: (data["timestamp"] as? Timestamp)?.dateValue())
                let color = data["color"] as? [Double] ?? [1,1,1]
                let name = queryDocumentSnapshot.documentID
                
                let post = Post(postName: name, title: title, text: text, color: color, timeStamp: timeStamp ?? "Unknown Date")
                
                return post
            }
        }
    }
    
    func saveData(boardName: String, postName: String, title: String, text: String, color: UIColor) {
        print(title, color)
        
        let date = Date()
        let strdate = formatDate(date: date)
        
        db.collection("boards").document(boardName).collection("posts").document(postName).setData([
            "title": title,
            "text": text,
            "color": [color.redComponent, color.greenComponent, color.blueComponent],
            "timestamp": Timestamp(date: Date())
            
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }

    
    }
    
    func createPost(boardName: String, title: String, text: String, color: UIColor) {
        print(title, color)
        
        let date = Date()
        let strdate = formatDate(date: date)
        
        
        var ref: DocumentReference? = nil
        ref = self.db.collection("boards").document(boardName).collection("posts").addDocument(data: [
            "title": title,
            "text": text,
            "color": [color.redComponent, color.greenComponent, color.blueComponent],
            "timestamp": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
    
    func deleteData(boardName: String, postName: String) {
        db.collection("boards").document(boardName).collection("posts").document(postName).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    private func formatDate(date: Date?) -> String? {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let strdate = formatter.string(from: date ?? Date())
        
        return formatter.string(from: date ?? Date())
        
    }
}
