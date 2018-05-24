//
//  MainInteractor.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import DataManager
import RxSwift

class MainInteractor: MainInteractorInput {
    var repository: DataStore!

    init(repository data: DataStore) {
        repository = data
    }

    func getFakeList() -> Single<FakeEntity> {
        return repository.fetchFakeList()
    }

    func saveInformationEntity(info entity: Info) -> Completable {
        return repository.persist(info: entity).thruInternet()
    }
}
