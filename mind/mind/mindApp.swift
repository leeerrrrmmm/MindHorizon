//
//  mindApp.swift
//  mind
//
//  Created by .Leeerrrmmm . on 04.03.2025.
//

import SwiftUI

@main
struct mindApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
