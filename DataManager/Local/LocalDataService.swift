//
//  LocalDatabase.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

public protocol LocalDataService {
    func retrieveFakeList() -> Single<FakeEntity>

    func update(info entity: Info) -> Completable

    func remove(info entity: Info?) -> Completable
}
