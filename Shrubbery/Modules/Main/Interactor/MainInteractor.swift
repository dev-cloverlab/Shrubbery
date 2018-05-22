//
//  MainInteractor.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class MainInteractor: MainInteractorInput {
    var repository: DataStore!

    init(repository data: DataStore) {
        repository = data
    }

    func getFakeList() -> Single<FakeEntity> {
        return repository.fetchFakeList().thruInternet()
    }

    func saveInformationEntity(info entity: InformationEntity) -> Completable {
        return repository.writeInformation(info: entity).thruInternet()
    }
}
