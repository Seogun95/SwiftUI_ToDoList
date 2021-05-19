//
//  ItemModels.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import Foundation
import SwiftUI

struct ItemModels: Identifiable {
    var id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModels {
        ItemModels(id: id, title: title, isCompleted: !isCompleted)
    }
}
