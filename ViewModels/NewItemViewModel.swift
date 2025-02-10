//
//  NewItemViewModel.swift
//  FirstTest
//
//  Created by Dylan Wong on 4/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var deadline = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(folderTitle: String) {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, deadline: deadline.timeIntervalSince1970, created: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("folders")
            .document(folderTitle)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard deadline >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
