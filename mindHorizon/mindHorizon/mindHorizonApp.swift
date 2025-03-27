//
//  mindHorizonApp.swift
//  mindHorizon
//
//  Created by .Leeerrrmmm . on 27.03.2025.
//

import SwiftUI

@main
struct mindHorizonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
