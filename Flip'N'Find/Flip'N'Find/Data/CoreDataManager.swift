//
//  CoreDataManager.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 22/05/23.
//

import Foundation
import CoreData

class CoreDataManager {
    // Singleton instance
    static let shared = CoreDataManager()

    // Initialize the persistent container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LeaderboardUserData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        })
        print(container.persistentStoreDescriptions.first?.url ?? "No Persistent Database")
        return container
    }()

    // Access the managed object context
    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
