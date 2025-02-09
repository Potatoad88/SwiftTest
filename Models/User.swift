//
//  User.swift
//  FirstTest
//
//  Created by Dylan Wong on 3/2/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
