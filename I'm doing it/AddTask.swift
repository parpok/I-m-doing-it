//
//  AddTask.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import SwiftData
import SwiftUI

struct AddTask: View {
    @State var Task: TaskToDo
    @Environment(\.modelContext) private var ModelContext
    @Environment(\.dismiss) private var Dismiss

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Naming")) {
                    TextField("Task name", text: $Task.content, axis: .vertical).bold().font(.title2).fontDesign(.rounded)
                    Text("Make it simple and very easy to do. It should also be very descriptive.").font(.caption)
                }
                Section(header: Text("Timing")) {
                    DatePicker("When you want to start it", selection: $Task.day, displayedComponents: .date)
                    DatePicker("Around what time would you like to do it", selection: $Task.day, displayedComponents: .hourAndMinute)
                }
                Section(header: Text("Other")) {
                    Toggle("Do you want to repeat it?", isOn: $Task.isRepeating)
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
                        ModelContext.insert(Task)
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
    AddTask(Task: PreviewTask)
}
