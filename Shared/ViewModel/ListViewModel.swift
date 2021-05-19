//
//  ListViewModel.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModels] = []
    
    init() {
        getList()
    }
    
    func getList() {
        let newItems = [
                ItemModels(title: "치과 예약하기", isCompleted: false),
                ItemModels(title: "우유 사기", isCompleted: true),
                ItemModels(title: "코 치료 세번", isCompleted: false)
            ]
        items.append(contentsOf: newItems)
    }
    
    
}