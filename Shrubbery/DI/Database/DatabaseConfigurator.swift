//
//  DatabaseConfigurator.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/24.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CoreData
import DataManager
import RealmSwift
import Swinject

class DatabaseConfigurator: Assembly {
    func assemble(container: Container) {

        // MARK: - Necessary Objects

        // For Core Data
        container.register(NSPersistentContainer.self) { _ in
            let persistentContainer = NSPersistentContainer(name: ShrubberyCoreDataConstants.coredataName)
            persistentContainer.loadPersistentStores { _, error in
                if let error = error {
                    fatalError("Unresolved error, \((error as NSError).userInfo)")
                }
            }

            return persistentContainer
        }
        container.register(NSManagedObjectContext.self) { r in
            r.resolve(NSPersistentContainer.self)!.viewContext
        }
        // For Realm
        container.register(Realm.self) { _ in
            do {
                return try Realm()
            } catch {
                fatalError("Creating a Realm()'s object failed!")
            }
        }

        // MARK: - Provide to the others Assembly

        container.register(LocalDataService.self, name: "coredata") {
            ShrubberyCoreData(content: $0.resolve(NSManagedObjectContext.self)!)
        }
        container.register(LocalDataService.self, name: "realm") {
            ShrubberyRealm($0.resolve(Realm.self)!)
        }
    }
}
