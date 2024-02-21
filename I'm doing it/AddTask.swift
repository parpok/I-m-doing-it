//
//  AddTask.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import SwiftData
import SwiftUI

@MainActor
struct AddTask: View {
    @Environment(\.modelContext) private var ModelContext
    @Environment(\.dismiss) private var Dismiss

    @State var TaskContent: String = ""
    @State var TaskDay: Date = .now
    @State var TaskTime: TimeOfDay = TimeOfDay.Morning
    @State var TaskIsRepeating: Bool = false

    @State private var displayNoTaskNameAlert = false

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Naming")) {
                    TextField("Task name", text: $TaskContent, axis: .vertical).bold().font(.title2).fontDesign(.rounded)
                    Text("Make it simple and very easy to do. It should also be very descriptive.").font(.caption)
                }
                Section(header: Text("Timing")) {
                    DatePicker("When you want to start doing it", selection: $TaskDay, displayedComponents: .date)
                    Picker("When do you want to do it", selection: $TaskTime) {
                        Text("Morning").tag(TimeOfDay.Morning)
                        Text("Afternoon").tag(TimeOfDay.Afternoon)
                        Text("Evening").tag(TimeOfDay.Evening)
                        Text("Night").tag(TimeOfDay.Night)
                    }.pickerStyle(.segmented)
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
                        if TaskContent.isEmpty == true {
                            displayNoTaskNameAlert.toggle()
                        } else {
                            ModelContext.insert(TaskToDo(id: UUID(), content: TaskContent, day: TaskDay, timeOfDay: TaskTime.rawValue, isRepeating: TaskIsRepeating, isDone: false))
                            Dismiss()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }.accessibilityLabel(Text("Save task")).alert("Cannot save a task without its name", isPresented: $displayNoTaskNameAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }
        }.navigationTitle("Add Task")
    }
}

#Preview {
    AddTask()
}
