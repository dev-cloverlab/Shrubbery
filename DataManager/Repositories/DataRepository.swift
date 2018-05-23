//
//  DataRepository.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class DataRepository: DataStore {
    private var local: DataStore!
    private var remote: DataStore!

    init(local localStore: DataStore, remote remoteStore: DataStore) {
        local = localStore
        remote = remoteStore
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return remote.fetchFakeList()
    }

    func persist(info entity: Info) -> Completable {
        return local.persist(info: entity)
    }
}
