//
//  ShrubberyServiceImpl.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import RxAlamofire
import ObjectMapper

class ShrubberyService: ShrubberyRemoteExt, RemoteService {
    func retrieveFakeList() -> Single<FakeEntity> {
        let uri = ShrubberyConfig.BASE_SERVICE_DOMAIN + "/api/v1/info/list"

        return getRequest(uri: uri) as Single<FakeEntity>
    }
}
