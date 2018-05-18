//
//  RemoteDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class RemoteDataStore: DataStore {
    var service: RemoteService!

    init(remote service: RemoteService) {
        self.service = service
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return service.retrieveFakeList()
    }
}
