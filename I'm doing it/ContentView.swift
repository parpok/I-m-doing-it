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
    @Query var tasks: [TaskToDo]
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    Text(task.content)
                }
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $isPresented, content: {
                        AddTask(Task: emptyTask)
                    })
                }
            }
        }
    }
}

let emptyTask = TaskToDo(id: UUID(), content: "", day: .now, isRepeating: false, isDone: false)

#Preview {
    ContentView()
}
