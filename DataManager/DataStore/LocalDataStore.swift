//
//  LocalDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

public class LocalDataStore: DataStore {
    private var localCoreData: LocalDataService!
    private var localRealm: LocalDataService!

    public init(coredata local: LocalDataService, realm: LocalDataService) {
        localCoreData = local
        localRealm = realm
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return localRealm.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        return localRealm.update(info: entity!)
    }
}
