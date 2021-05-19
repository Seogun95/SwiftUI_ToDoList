//
//  ContentView.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "안녕하세요"
    ]
    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(listTitle: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
        }
        .navigationBarTitle("할일 목록")
        .navigationBarItems(leading: EditButton())
        .listStyle(PlainListStyle())
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
