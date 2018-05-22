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

    init(coredata local: LocalDataService) {
        localCoreData = local
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return localCoreData.retrieveFakeList()
    }
}
