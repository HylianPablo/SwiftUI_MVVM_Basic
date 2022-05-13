//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by Pablo Martinez Lopez on 13/5/22.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList: ObservableObject {
    @Published var items: [ToDoListItem] = []
}

struct ContentView: View {
    @ObservedObject var viewModel: ToDoList = ToDoList()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.items = [
                    ToDoListItem(action: "Get milk"),
                    ToDoListItem(action: "Get water"),
                    ToDoListItem(action: "Get coffee")
                ]
            }, label: {
                Text("Refresh")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
