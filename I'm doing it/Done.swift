//
//  Done.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 05/02/2024.
//

import SwiftData
import SwiftUI

struct Done: View {
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == true }, sort: [SortDescriptor(\TaskToDo.content)], animation: .default) var StuffDone: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == true && item.timeOfDay == "Morning" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeInOut) var MorningStuffDone: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == true && item.timeOfDay == "Afternoon" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeInOut) var AfternoonStuffDone: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == true && item.timeOfDay == "Evening" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeInOut) var EveningStuffDone: [TaskToDo]
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone == true && item.timeOfDay == "Night" }, sort: [SortDescriptor(\TaskToDo.content)], animation: .easeInOut) var NightStuffDone: [TaskToDo]
    @Environment(\.modelContext) private var ModelContext
    @Environment(\.dismiss) private var Dismiss

    var body: some View {
        NavigationStack {
            if StuffDone.isEmpty == true {
                ContentUnavailableView("No completed tasks", systemImage: "exclamationmark.triangle.fill", description: Text("Please complete some tasks"))
            }
            List {
                if MorningStuffDone.isEmpty == false {
                    Section(header: Text("Morning")) {
                        ForEach(MorningStuffDone) { thing in
                            Text(thing.content)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        ModelContext.delete(thing)
                                    }

                                    Button("Restore", systemImage: "restart.circle") {
                                        thing.isDone.toggle() // This is just so tasks can be restored in case of accidental click
                                    }
                                }
                        }
                    }
                }
                if AfternoonStuffDone.isEmpty == false {
                    Section(header: Text("Afternoon")) {
                        ForEach(AfternoonStuffDone) { thing in
                            Text(thing.content)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        ModelContext.delete(thing)
                                    }

                                    Button("Restore", systemImage: "restart.circle") {
                                        thing.isDone.toggle() // This is just so tasks can be restored in case of accidental click
                                    }
                                }
                        }
                    }
                }
                if EveningStuffDone.isEmpty == false {
                    Section(header: Text("Evening")) {
                        ForEach(EveningStuffDone) { thing in
                            Text(thing.content)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        ModelContext.delete(thing)
                                    }

                                    Button("Restore", systemImage: "restart.circle") {
                                        thing.isDone.toggle() // This is just so tasks can be restored in case of accidental click
                                    }
                                }
                        }
                    }
                }
                if NightStuffDone.isEmpty == false {
                    Section(header: Text("Night")) {
                        ForEach(NightStuffDone) { thing in
                            Text(thing.content)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        ModelContext.delete(thing)
                                    }

                                    
                                    Button("Restore", systemImage: "restart.circle") {
                                        thing.isDone.toggle() // This is just so tasks can be restored in case of accidental click
                                    }
                                }
                        }
                    }
                }
            }.navigationTitle("Completed tasks").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        Dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }.overlay {
                if StuffDone.isEmpty == true {
                    ContentUnavailableView("No completed tasks", systemImage: "exclamationmark.triangle.fill", description: Text("Please complete some tasks"))
                }
            }
        }
    }
}

#Preview {
    Done()
}
