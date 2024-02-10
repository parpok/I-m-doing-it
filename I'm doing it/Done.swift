//
//  Done.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 05/02/2024.
//

import SwiftData
import SwiftUI

struct Done: View {
    @Query(filter: #Predicate<TaskToDo> { item in item.isDone }, sort: [SortDescriptor(\TaskToDo.content)]) var StuffDone: [TaskToDo]
    @Environment(\.modelContext) private var ModelContext
    @Environment(\.dismiss) private var Dismiss

    var body: some View {
        NavigationStack {
            List {
                ForEach(StuffDone) { thing in
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
            }.navigationTitle("Completed tasks").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        Dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    Done()
}
