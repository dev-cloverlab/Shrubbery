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

        container.register(NSManagedObjectContext.self) { _ in
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("Can't cast to AppDelegate!")
            }

            return appDelegate.persistentContainer.viewContext
        }
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
