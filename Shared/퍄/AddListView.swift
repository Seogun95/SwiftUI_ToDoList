//
//  AddListView.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

struct AddListView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel

    @State var TextFieldTitle: String = ""
    @State var showAlert: Bool = false
    @State var AlertTitle: String = ""
 
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("해야할 일을 작성해주세요", text: $TextFieldTitle)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                Button(action: {
                    saveButtonPressed()
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if textAppropriate() {
        listViewModel.addItems(title: TextFieldTitle)
        presentationMode.wrappedValue.dismiss()
            
        }
    }
    
    func textAppropriate() -> Bool {
        if TextFieldTitle.count < 2 {
            AlertTitle = "두 글자 이상 입력해주세요."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(AlertTitle), message: nil, dismissButton: .default(Text("확인")))
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddListView()
        }
        .environmentObject(ListViewModel())
    }
}
