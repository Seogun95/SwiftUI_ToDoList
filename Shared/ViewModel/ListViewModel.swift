//
//  ListViewModel.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import Foundation

class ListViewModel: ObservableObject {
    
    let saveKey: String = "items_list"
    
    @Published var items: [ItemModels] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        getList()
    }
    
    func getList() {
//        let newItems = [
//                ItemModels(title: "치과 예약하기", isCompleted: false),
//                ItemModels(title: "우유 사기", isCompleted: true),
//                ItemModels(title: "코 치료 세번", isCompleted: false)
//            ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let saveItem = try?JSONDecoder().decode([ItemModels].self, from: data)
        else { return }
        
        self.items = saveItem
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
    
    func saveItem() {
        if let EncodeData = try?JSONEncoder().encode(items) {
            UserDefaults.standard.set(EncodeData, forKey: saveKey)
        }
    }
}
