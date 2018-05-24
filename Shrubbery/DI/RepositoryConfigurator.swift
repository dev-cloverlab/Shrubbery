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

        container.register(DataStore.self, name: "local") {
            LocalDataStore(coredata: $0.resolve(LocalDataService.self, name: "coredata")!,
                           realm: $0.resolve(LocalDataService.self, name: "realm")!)
        }
        container.register(DataStore.self, name: "remote") {
            RemoteDataStore(alamofire: $0.resolve(RemoteDataService.self, name: "alamofire")!,
                            moya: $0.resolve(RemoteDataService.self, name: "moya")!)
        }

        // MARK: - Provides to others modules.

        container.register(DataStore.self, name: "repo") {
            DataRepository(local: $0.resolve(DataStore.self, name: "local")!,
                           remote: $0.resolve(DataStore.self, name: "remote")!)
        }
    }
}
