//
//  Persistent.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyCoreData")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
