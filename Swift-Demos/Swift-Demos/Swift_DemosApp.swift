//
//  Swift_DemosApp.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import SwiftUI

@main
struct Swift_DemosApp: App {
    @StateObject var pets: MyPets = MyPets()
    let persrsistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(pets).environment(\.managedObjectContext, persrsistenceController.container.viewContext)        }
    }
}
