//
//  ShrubberyRealm.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class ShrubberyRealm: LocalDataService {
    func retrieveFakeList() -> Single<FakeEntity> {
        fatalError("retrieveFakeList() has not been implemented")
    }

    func updateInformation(info: InformationEntity) -> Completable {
        fatalError("updateInformation(info:) has not been implemented")
    }
}