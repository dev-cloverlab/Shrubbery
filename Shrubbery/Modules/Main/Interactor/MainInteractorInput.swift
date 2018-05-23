//
//  MainInteractorInput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import RxSwift
import DataManager

protocol MainInteractorInput: Interactable {
    func getFakeList() -> Single<FakeEntity>

    func saveInformationEntity(info entity: Info) -> Completable
}
