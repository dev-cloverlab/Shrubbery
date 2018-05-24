//
//  RepositoryConfigurator.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/24.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import DataManager
import Swinject

class RepositoryConfigurator: Assembly {
    func assemble(container: Container) {

        // MARK: - Necessary Objects.

        container.register(DataStore.self, name: "local") { r in
            LocalDataStore(coredata: r.resolve(LocalDataService.self, name: "coredata")!,
                           realm: r.resolve(LocalDataService.self, name: "realm")!)
        }
        container.register(DataStore.self, name: "remote") { r in
            RemoteDataStore(alamofire: r.resolve(RemoteDataService.self, name: "alamofire")!,
                            moya: r.resolve(RemoteDataService.self, name: "moya")!)
        }

        // MARK: - Provides to others modules.

        container.register(DataStore.self, name: "repo") { r in
            DataRepository(local: r.resolve(DataStore.self, name: "local")!,
                           remote: r.resolve(DataStore.self, name: "remote")!)
        }
    }
}
