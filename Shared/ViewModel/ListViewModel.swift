//
//  ListViewModel.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModels] = [] {
        didSet {
        }
    }
    
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
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItems(title: String) {
        let newItems = ItemModels(title: title, isCompleted: false)
        items.append(newItems)
    }
    func updateItems(item: ItemModels) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
