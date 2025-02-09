//
//  FolderViewModel.swift
//  FirstTest
//
//  Created by Dylan Wong on 9/2/25.
//

import FirebaseFirestore
import Foundation

class FolderViewModel: ObservableObject {
    @Published var showingNewFolderView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(title: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("folders")
            .whereField("title", isEqualTo: title)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error checking folder to delete: \(error.localizedDescription)")
                    return
                }
                
                guard let snapshot = snapshot, !snapshot.isEmpty else {
                    print("No folder found with title: \(title)")
                    return
                }
                
                for document in snapshot.documents {
                    let documentId = document.documentID
                    db.collection("users")
                        .document(self.userId)
                        .collection("folders")
                        .document(documentId)
                        .delete() { error in
                            if let error = error {
                                print("Error deleting folder: \(error.localizedDescription)")
                            } else {
                                print("Folder deleted successfully.")
                            }
                        }
                }
            }
    }
}
