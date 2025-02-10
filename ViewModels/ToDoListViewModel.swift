//
//  ToDoListViewModel.swift
//  FirstTest
//
//  Created by Dylan Wong on 4/2/25.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    private let folderTitle: String
    
    init(userId: String, folderTitle: String) {
        self.userId = userId
        self.folderTitle = folderTitle
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("folders")
            .document(folderTitle)
            .collection("todos")
            .document(id)
            .delete()
    }
}
