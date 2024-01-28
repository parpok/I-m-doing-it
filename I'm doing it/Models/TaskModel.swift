//
//  TaskModel.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import Foundation
import SwiftData

enum TimeOfDay: Codable{
    case Morning
    case Afternoon
    case Evening
    case Night

    case Unknown

    init(from date: Date = Date()) {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 7 ..< 12:
            self = .Morning
        case 12 ..< 17:
            self = .Afternoon
        case 17 ..< 20:
            self = .Evening
        case 20 ..< 23:
            self = .Night
        default:
            self = .Unknown
        }
    }
}

@Model
class TaskToDo {
    @Attribute(.unique) var id: UUID
    @Attribute(.spotlight) var content: String
    var day: Date
    var timeOfDay: TimeOfDay?
    var isRepeating: Bool
    var isDone: Bool

    init(id: UUID, content: String, day: Date, timeOfDay: TimeOfDay? = nil, isRepeating: Bool, isDone: Bool) {
        self.id = id
        self.content = content
        self.day = day
        self.timeOfDay = TimeOfDay(from: day)
        self.isRepeating = isRepeating
        self.isDone = isDone
    }
}
