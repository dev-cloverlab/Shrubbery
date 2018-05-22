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
        var request = provider.request(.retrieveFakeList)
#if DEBUG
        request = request.debug()
#endif
        return request.mapString().mapToObject(FakeEntity.self)
    }
}
