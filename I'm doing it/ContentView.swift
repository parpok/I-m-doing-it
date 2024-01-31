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
    @State private var isPresented = false
    @Query var tasks: [TaskToDo] // Sort using the Enum TimeOfDay value

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Right now")) { // When sorting happens change it
                    ForEach(tasks) { task in
                        TaskViewButton(Task: task)
//                            .swipeActions(allowsFullSwipe: true) {
//                                Button("Delete", systemImage: "trash", role: .destructive) {
//                                    ModelContext.delete(task)
//                                } This should be only for testing
//                            }
                    }

                    //                Section(header: Text("Afternoon")) {
                    //                    ForEach(tasks) { task in TaskViewButton(Task: task) }
                    //                }
                    //                Section(header: Text("Evening")) {
                    //                    ForEach(tasks) { task in TaskViewButton(Task: task) }
                    //                }
                    //                Section(header: Text("Night")) {
                    //                    ForEach(tasks) { task in TaskViewButton(Task: task) }
                    //                }
                    //
                    //                Make it sortable with @queries
                }
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $isPresented, content: {
                        AddTask(Task: TaskToDo(id: UUID(), content: "", day: .now, isRepeating: false, isDone: false)) // It must be like this so when someone adds mutiple items in the same instance of the app they will appear as other items and not override the added item
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
