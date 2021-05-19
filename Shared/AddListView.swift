//
//  AddListView.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct AddListView: View {
    @State var TextFieldTitle: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("해야할 일을 작성해주세요", text: $TextFieldTitle)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("저장")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
        .navigationBarTitle("할일 목록 추가")
    }
    
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddListView()
        }
    }
}
