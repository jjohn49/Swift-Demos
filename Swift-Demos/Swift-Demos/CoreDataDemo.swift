//
//  CoreDataDemo.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/1/22.
//

import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "People")
        
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
