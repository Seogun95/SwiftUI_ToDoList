//
//  ListRoewView.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct ListRowView: View {
    
    var items: ItemModels
    
    var body: some View {
        HStack {
            Image(systemName: items.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(items.isCompleted ? Color.green : Color.red)
            Text(items.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        ListRowView(items: ItemModels(title: "안녕하세요", isCompleted: false))
        ListRowView(items: ItemModels(title: "안녕하세요", isCompleted: true))
        }
        .previewLayout(.sizeThatFits)
    }
}
