// Created by Enes UTKU

import SwiftUI
import SwiftData

@main
struct SwiftData_BasicsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // This line retrieves the container for the Data model from the context or environment where models are managed.
        .modelContainer(for: Data.self)
    }
}
