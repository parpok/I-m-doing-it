//
//  TaskViewButton.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 29/01/2024.
//

import SwiftUI

struct TaskViewButton: View {
    var Task: TaskToDo

    var body: some View {
        HStack {
            Image(systemName: Task.isDone ? "checkmark.square" : "square")
            Text(Task.content)/*.bold().fontDesign(.rounded)*/

            Button("") {
                Task.isDone.toggle()
            }
        }
    }
}

#Preview {
    TaskViewButton(Task: PreviewTask)
}
