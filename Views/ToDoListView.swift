//
//  ToDoListView.swift
//  FirstTest
//
//  Created by Dylan Wong on 4/2/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    var folderTitle: String
    
    init(userId: String, folderTitle: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/folders/\(folderTitle)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId, folderTitle: folderTitle))
        self.folderTitle = folderTitle
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item, folderTitle: folderTitle)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView, folderTitle: folderTitle)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "8ql7TlouANRZIVE2h7wOziAEkZI2", folderTitle: "folder title")
}
