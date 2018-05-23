//
//  RemoteDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

public class RemoteDataStore: DataStore {
    private var v1Service: RemoteDataService!
    private var v2Service: RemoteDataService!

    public init(alamofire remote1: RemoteDataService, moya remote2: RemoteDataService) {
        self.v1Service = remote1
        self.v2Service = remote2
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return v2Service.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        fatalError("writeInformation(info:) has not been implemented")
    }
}
