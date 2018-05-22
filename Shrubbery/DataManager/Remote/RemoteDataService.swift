//
//  RemoteService.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol RemoteDataService {
    func retrieveFakeList() -> Single<FakeEntity>
}
