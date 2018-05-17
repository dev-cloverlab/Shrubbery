//
//  RemoteDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import RxSwift

class RemoteDataStore: DataStore {
    var service: RemoteService!

    init(remote service: RemoteService) {
        self.service = service
    }

    func fetchFakeList() -> Single<[String]> {
        return Single.create { single in
            single(.success(["1231", "4531gfw", "fref134f134", "fjivdfji"]))
            return Disposables.create {
            }
        }
    }
}