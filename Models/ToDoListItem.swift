//
//  ToDoListItem.swift
//  FirstTest
//
//  Created by Dylan Wong on 4/2/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let deadline: TimeInterval
    let created: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
