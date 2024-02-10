//
//  TaskModel.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import Foundation
import SwiftData

enum TimeOfDay: String, Codable, CaseIterable, Identifiable {
    case Morning
    case Afternoon
    case Evening
    case Night

    case Unknown = "Other"

    var id: Self { self }
}

@Model
class TaskToDo {
    @Attribute(.unique) var id: UUID
    @Attribute(.spotlight) var content: String
    var day: Date
    var timeOfDay: TimeOfDay
    var isRepeating: Bool
    var isDone: Bool

    init(id: UUID, content: String, day: Date, timeOfDay: TimeOfDay, isRepeating: Bool, isDone: Bool) {
        self.id = id
        self.content = content
        self.day = day
        self.timeOfDay = timeOfDay
        self.isRepeating = isRepeating
        self.isDone = false
    }
}
