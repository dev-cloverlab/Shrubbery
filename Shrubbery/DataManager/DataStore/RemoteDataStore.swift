//
//  RemoteDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation

class RemoteDataStore: DataStore {
    var service: RemoteService!

    init(remote service: RemoteService) {
        self.service = service
    }

    func fetchFakeList() -> RxSwift.Single<[String]> {
        fatalError("fetchWatchList() has not been implemented")
    }
}