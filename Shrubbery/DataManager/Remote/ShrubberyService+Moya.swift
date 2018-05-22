//
//  ShrubberyService+Moya.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Moya
import RxSwift

class ShrubberyMoyaService: RestHttpRequest, RemoteDataService {
    let provider = MoyaProvider<ShrubberyMoyaConfig>().rx

    func retrieveFakeList() -> RxSwift.Single<FakeEntity> {
        return provider
            .request(.retrieveFakeList)
            .asObservable()
            .mapString()
            .mapToObject(type: FakeEntity.self)
            .asSingle()
    }
}
