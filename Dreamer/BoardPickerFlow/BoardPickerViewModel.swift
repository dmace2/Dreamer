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
        
        let boardList = db.collection("boards").order(by: "timestamp", descending: true)
        boardList.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.boards = documents.map { queryDocumentSnapshot -> Board in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let timeStamp = self.formatDate(date: (data["timestamp"] as? Timestamp)?.dateValue())//(data["timestamp"] as? Timestamp)?.dateValue()
                let color = data["color"] as? [Double] ?? [1,1,1]
                let name = queryDocumentSnapshot.documentID
                
                let board = Board(boardName: name, title: title, color: color, timeStamp: timeStamp ?? "Unknown Date")
                
                return board
            }
        }
    }
    
    func saveData(title: String, color: UIColor) {
        print(title, color)
        
        let date = Date()
        let strdate = formatDate(date: date)
        
        
        var ref: DocumentReference? = nil
        ref = self.db.collection("boards").addDocument(data: [
            "title": title,
            "color": [color.redComponent, color.greenComponent, color.blueComponent],
            "timestamp": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                let newBoard = Board(boardName: ref!.documentID, title: title,  color: [Double(color.redComponent), Double(color.greenComponent), Double(color.blueComponent)], timeStamp: strdate ?? "Unknown Date")
            }
        }
    }
    
    func deleteData(boardName: String) {
        db.collection("boards").document(boardName).delete() { err in
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
