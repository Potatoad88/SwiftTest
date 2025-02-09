//
//  NewFolderView.swift
//  FirstTest
//
//  Created by Dylan Wong on 9/2/25.
//

import SwiftUI

struct NewFolderView: View {
    @StateObject var viewModel = NewFolderViewModel()
    @Binding var newFolderPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Folder")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Save", backgroundColor: Color.pink, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newFolderPresented = false
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
    NewFolderView(newFolderPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
