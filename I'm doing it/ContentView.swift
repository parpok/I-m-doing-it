//
//  ContentView.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var ModelContext
    @State private var isAddTaskPresented = false
    @State private var isDonePresented = false
    @Query var tasks: [TaskToDo] // Sort using the Enum TimeOfDay value

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Right now")) { // When sorting happens change it
                    ForEach(tasks) { task in
                        TaskViewButton(Task: task)
                    }
                }
                Button{
                    isDonePresented.toggle()
                } label: {
                    Text("Show done items")
                }.sheet(isPresented: $isDonePresented, content: {
                    Done()
                })
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddTaskPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $isAddTaskPresented, content: {
                        AddTask()
                    })
                }
            }.navigationTitle("I'm doing it")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TaskToDo.self, inMemory: true)
}
