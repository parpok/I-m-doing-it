//
//  AddTask.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import SwiftData
import SwiftUI

struct AddTask: View {
    @Environment(\.modelContext) private var ModelContext
    @Environment(\.dismiss) private var Dismiss
    
    @State var TaskContent: String = ""
    @State var TaskDay:Date = .now
    @State var TaskIsRepeating: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Naming")) {
                    TextField("Task name", text: $TaskContent, axis: .vertical).bold().font(.title2).fontDesign(.rounded)
                    Text("Make it simple and very easy to do. It should also be very descriptive.").font(.caption)
                }
                Section(header: Text("Timing")) {
                    DatePicker("When you want to start it", selection: $TaskDay, displayedComponents: .date)
                    DatePicker("Around what time would you like to do it", selection: $TaskDay, displayedComponents: .hourAndMinute)
                }
                Section(header: Text("Other")) {
                    Toggle("Do you want to repeat it?", isOn: $TaskIsRepeating)
                }
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        Dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        ModelContext.insert(TaskToDo(id: UUID(), content: TaskContent, day: TaskDay, isRepeating: TaskIsRepeating, isDone: false))
                        Dismiss()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.navigationTitle("Add Task")
    }
}

#Preview {
    AddTask()
}
