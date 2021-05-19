//
//  ListRoewView.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct ListRowView: View {
    var listTitle: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(listTitle)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listTitle: "안녕하세요")
    }
}
