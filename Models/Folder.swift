//
//  Folder.swift
//  FirstTest
//
//  Created by Dylan Wong on 9/2/25.
//

import FirebaseFirestore
import Foundation

struct Folder: Identifiable, Decodable {
    @DocumentID var id: String?
    var title: String
}
