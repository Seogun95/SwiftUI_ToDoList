//
//  ContentView.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModels] = [
        ItemModels(title: "치과 예약하기", isCompleted: false),
        ItemModels(title: "우유 사기", isCompleted: true),
        ItemModels(title: "코 치료 세번", isCompleted: false)
    ]
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    ListRowView(items: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
        }
        .navigationBarTitle("할일 목록")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink(
                                destination: AddListView(),
                                label: {
                                    Text("목록 추가")
                                }))
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
