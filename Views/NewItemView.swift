//
//  NewItemView.swift
//  FirstTest
//
//  Created by Dylan Wong on 4/2/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var folderTitle: String
    
    init(newItemPresented: Binding<Bool>, folderTitle: String) {
        self._newItemPresented = newItemPresented
        self.folderTitle = folderTitle
    }
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Deadline", selection: $viewModel.deadline)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", backgroundColor: Color.pink, action: {
                    if viewModel.canSave {
                        viewModel.save(folderTitle: self.folderTitle)
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                })
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields correctly."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }), folderTitle: "folder title")
}
