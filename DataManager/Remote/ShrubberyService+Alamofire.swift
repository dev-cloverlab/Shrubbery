//
//  ShrubberyServiceImpl.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxAlamofire
import RxSwift

public class ShrubberyAlamofireService: RestHttpRequest, RemoteDataService {
    public init() {
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        let uri = ShrubberyServiceConfig.baseServiceDomain + "/api/v1/info/list"

        return getRequest(uri: uri)
    }
}

