//
//  LocalDatabase.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol LocalCoreData {
    func retrieveFakeList() -> Single<FakeEntity>

    func updateInformation(info: InformationEntity) -> Completable
}