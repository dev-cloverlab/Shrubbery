//
//  MainInteractorInput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import RxSwift

protocol MainInteractorInput: Interactor {
    func getFakeList() -> Single<FakeEntity>

    func saveInformationEntity(info entity: InformationEntity) -> Completable
}
