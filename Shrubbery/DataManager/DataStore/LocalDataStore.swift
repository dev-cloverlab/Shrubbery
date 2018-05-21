//
//  LocalDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class LocalDataStore: DataStore {
    var localCoreData: LocalCoreData!

    init(coredata local: LocalCoreData) {
        localCoreData = local
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return localCoreData.retrieveFakeList()
    }
}
