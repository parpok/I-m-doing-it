//
//  I_m_doing_itApp.swift
//  I'm doing it
//
//  Created by Patryk Puciłowski on 28/01/2024.
//

import SwiftUI
import SwiftData

@main
struct I_m_doing_itApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: TaskToDo.self)
    }
}
