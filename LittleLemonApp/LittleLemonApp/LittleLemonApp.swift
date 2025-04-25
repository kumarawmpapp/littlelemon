//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            OnboardingView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
