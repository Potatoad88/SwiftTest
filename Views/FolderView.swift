//
//  FolderView.swift
//  FirstTest
//
//  Created by Dylan Wong on 9/2/25.
//

import FirebaseFirestore
import SwiftUI

struct FolderView: View {
    @StateObject var viewModel: FolderViewModel
    @FirestoreQuery var folders: [Folder]
    
    var userId: String
    
    init(userId: String) {
        self._folders = FirestoreQuery(collectionPath: "users/\(userId)/folders")
        self._viewModel = StateObject(wrappedValue: FolderViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(folders) { folder in
                    NavigationLink(destination: ToDoListView(userId: self.userId, folderTitle: folder.title)) {
                        Text(folder.title)
                    }
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(title: folder.title)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Folders")
            .toolbar {
                Button {
                    viewModel.showingNewFolderView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewFolderView) {
                NewFolderView(newFolderPresented: $viewModel.showingNewFolderView)
            }
        }
    }
}

#Preview {
    FolderView(userId: "8ql7TlouANRZIVE2h7wOziAEkZI2")
}
