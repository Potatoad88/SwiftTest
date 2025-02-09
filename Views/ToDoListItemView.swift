//
//  ToDoListItemView.swift
//  FirstTest
//
//  Created by Dylan Wong on 6/2/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.deadline).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "title", deadline: Date().timeIntervalSince1970, created: Date().timeIntervalSince1970, isDone: false))
}
