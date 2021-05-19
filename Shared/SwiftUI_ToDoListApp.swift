//
//  SwiftUI_ToDoListApp.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/19.
//

import SwiftUI

@main
struct SwiftUI_ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
