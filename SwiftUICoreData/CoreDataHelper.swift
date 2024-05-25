//
//  CoreDataHelper.swift
//  SwiftUI_CoreData
//
//  Created by Abhinay Maurya on 24/05/24.
//

import Foundation
import CoreData

final class CoreDataHelper {
    static let shared = CoreDataHelper()
    private init() { }
    
    // Core Data stack
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Family")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            
            container.viewContext.automaticallyMergesChangesFromParent = true
            return container
        }()

        // Core Data saving support
        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}
