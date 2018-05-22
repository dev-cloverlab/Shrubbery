//
//  LocalDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class LocalDataStore: DataStore {
    var localCoreData: LocalDataService!
    var localRealm: LocalDataService!

    init(coredata local: LocalDataService, realm: LocalDataService) {
        localCoreData = local
        localRealm = realm
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return localRealm.retrieveFakeList()
    }

    func writeInformation(info entity: InformationEntity) -> Completable {
        return localRealm.updateInformation(info: entity)
    }
}
