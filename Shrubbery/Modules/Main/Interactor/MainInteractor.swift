//
//  MainInteractor.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import DataManager

class MainInteractor: MainInteractorInput {
    var repository: DataStore!

    init(repository data: DataStore) {
        repository = data
    }

    func getFakeList() -> Single<FakeEntity> {
//        return repository.fetchFakeList()
        return Single.just(FakeEntity())
    }

    func saveInformationEntity(info entity: Info) -> Completable {
        var ii = Info(id: 1231, title: "Hello world", updatedAt: Date())
        return repository.persist(info: nil).thruInternet()
//        return Completable.create { completable in
//            return Disposables.create()
//        }
    }
}
