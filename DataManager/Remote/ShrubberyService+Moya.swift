//
//  ShrubberyService+Moya.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Moya
import RxSwift

public class ShrubberyMoyaService: RestHttpRequest, RemoteDataService {
    private var provider: MoyaProvider<ShrubberyMoyaConfig>
    private lazy var rxProvider = {
        return provider.rx
    }()

    public init(_ provider: MoyaProvider<ShrubberyMoyaConfig>) {
        self.provider = provider
    }

    public func retrieveFakeList() -> RxSwift.Single<FakeEntity> {
        print("Hello world")
        var request = rxProvider.request(.retrieveFakeList)
#if DEBUG
        request = request.debug()
#endif
        return request.mapString().mapToObject(FakeEntity.self)
    }
}

