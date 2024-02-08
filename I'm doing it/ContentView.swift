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
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeOut) var tasks: [TaskToDo]

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Right now")) { // When sorting happens change it
                    ForEach(tasks) { task in
                        TaskViewButton(Task: task)
                    }
                }
                Button {
                    isDonePresented.toggle()
                } label: {
                    Text("Show completed items")
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
