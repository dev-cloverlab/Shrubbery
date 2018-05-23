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
    private var provider: MoyaProvider<ShrubberyMoyaConfig>
    private lazy var rxProvider = {
        return provider.rx
    }()

    init(_ provider: MoyaProvider<ShrubberyMoyaConfig>) {
        self.provider = provider
    }

    func retrieveFakeList() -> RxSwift.Single<FakeEntity> {
        var request = rxProvider.request(.retrieveFakeList)
#if DEBUG
        request = request.debug()
#endif
        return request.mapString().mapToObject(FakeEntity.self)
    }
}
