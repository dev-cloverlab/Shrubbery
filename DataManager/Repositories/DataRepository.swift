//
//  DataRepository.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

public class DataRepository: DataStore {
    private var local: DataStore!
    private var remote: DataStore!

    public init(local localStore: DataStore, remote remoteStore: DataStore) {
        local = localStore
        remote = remoteStore
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return remote.fetchFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        return local.persist(info: entity)
    }
}

