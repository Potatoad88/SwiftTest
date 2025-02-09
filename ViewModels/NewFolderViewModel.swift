//
//  NewFolderViewModel.swift
//  FirstTest
//
//  Created by Dylan Wong on 9/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewFolderViewModel: ObservableObject {
    @Published var title = ""
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("folders")
            .whereField("title", isEqualTo: title)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error checking for existing folder: \(error.localizedDescription)")
                    return
                }
                
                if let snapshot = snapshot, !snapshot.isEmpty {
                    print("Folder with this title already exists.")
                    self.showAlert = true
                    return
                }
                
                
                db.collection("users")
                    .document(uId)
                    .collection("folders")
                    .addDocument(data: [
                        "title": self.title
                    ]) { error in
                        if let error = error {
                            print("Error saving folder: \(error.localizedDescription)")
                            self.showAlert = true
                        } else {
                            print("Folder saved successfully")
                            self.title = ""
                        }
                    }
            }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}

