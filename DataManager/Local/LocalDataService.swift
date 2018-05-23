//
//  LocalDatabase.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol LocalDataService {
    func retrieveFakeList() -> Single<FakeEntity>

    func update(info entity: InformationEntity) -> Completable

    func remove(info entity: InformationEntity?) -> Completable
}
