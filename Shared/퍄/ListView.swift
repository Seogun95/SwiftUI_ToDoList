//
//  ContentView.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(items: item)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    listViewModel.updateItems(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("할일 목록")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink(
                                destination: AddListView(),
                                label: {
                                    Text("목록 추가")
                                }))
        
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
