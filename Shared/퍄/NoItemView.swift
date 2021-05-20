//
//  NoItemView.swift
//  SwiftUI_ToDoList
//
//  Created by Seogun Kim on 2021/05/20.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack{
                Text("서근메모앱 🤟")
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                
                Text("현재 설정된 목록이 없습니다. 목록을 추가하려면 아래 추가하기 버튼을 눌러 원하는 목록을 직접 설정 할 수 있습니다.")
                    .font(.headline)
                    .foregroundColor(Color(UIColor.systemGray))
                
                NavigationLink(
                    destination: AddListView(),
                    label: {
                        Text("목록 추가")
                            .fontWeight(.black)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(animate ? Color("peach") : Color("PalePurple"))
                            .cornerRadius(10)
                    })
                    .padding()
                    .padding(.horizontal, animate ? 30 : 40)
                    .offset(y: animate ? 0 : 10)
                    .shadow(color: animate ? Color("peach") : Color("PalePurple").opacity(0.6),
                            radius: animate ? 20 : 30,
                            x: 0.0,
                            y: animate ? 30 : 30)
            }
            .padding()
            .multilineTextAlignment(.center)
            .onAppear(perform: {
                getAnimation()
            })
        }
        .frame(maxWidth: 500)
    }
    
    func getAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeIn(duration: 3)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                NoItemView()
                    .navigationBarTitle("할일 목록")
            }
            .preferredColorScheme(.dark)
            
            NavigationView {
                NoItemView()
                    .navigationBarTitle("할일 목록")
            }
            .preferredColorScheme(.light)
        }
        
    }
}
