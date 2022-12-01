//
//  Swift_DemosApp.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import SwiftUI

@main
struct Swift_DemosApp: App {
    let persrsistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persrsistenceController.container.viewContext)
        }
    }
}
