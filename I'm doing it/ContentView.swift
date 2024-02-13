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

    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeInOut) var StuffNotDone: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false && item.timeOfDay == "Morning" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeOut) var MorningTasks: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false && item.timeOfDay == "Afternoon" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeOut) var AfternoonTasks: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false && item.timeOfDay == "Evening" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeOut) var EveningTasks: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == false && item.timeOfDay == "Night" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeOut) var NightTasks: [TaskToDo]

    var body: some View {
        NavigationStack {
            List {
                if MorningTasks.isEmpty == false {
                    Section(header: Text("Morning")) {
                        ForEach(MorningTasks) { task in
                            TaskViewButton(Task: task)
                        }
                    }
                }
                if AfternoonTasks.isEmpty == false {
                    Section(header: Text("Afternoon")) {
                        ForEach(AfternoonTasks) { task in
                            TaskViewButton(Task: task)
                        }
                    }
                }
                if EveningTasks.isEmpty == false {
                    Section(header: Text("Evening")) {
                        ForEach(EveningTasks) { task in
                            TaskViewButton(Task: task)
                        }
                    }
                }
                if NightTasks.isEmpty == false {
                    Section(header: Text("Night")) {
                        ForEach(NightTasks) { task in
                            TaskViewButton(Task: task)
                        }
                    }
                }
                if StuffNotDone.isEmpty == false {
                    Button {
                        isDonePresented.toggle()
                    } label: {
                        Text("Show completed items")
                    }.sheet(isPresented: $isDonePresented, content: {
                        Done()
                    })
                }
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
                .overlay {
                    if StuffNotDone.isEmpty == true {
                        ContentUnavailableView {
                            Label("Good job", systemImage: "checkmark.seal.fill")
                        } description: {
                            Text("You've completed everything")
                        } actions: {
                            Button {
                                isDonePresented.toggle()
                            } label: {
                                Text("Show completed items")
                            }.buttonStyle(.bordered).sheet(isPresented: $isDonePresented, content: {
                                Done()
                            })
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TaskToDo.self, inMemory: true)
}
