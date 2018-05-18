//
//  RemoteDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import RxAlamofire
import SwiftyJSON
import ObjectMapper

class RemoteDataStore: DataStore {
    var service: RemoteService!

    init(remote service: RemoteService) {
        self.service = service
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return string(.get, URL(string: "http://172.16.31.166:3000/api/v1/info/list")!)
            .observeOn(MainScheduler.instance)
            .flatMap { response -> Observable<FakeEntity> in
                guard let obj = Mapper<FakeEntity>().map(JSONString: response) else {
                    throw RxError.noElements
                }

                return Observable.just(obj)
            }.asSingle()
    }
}
