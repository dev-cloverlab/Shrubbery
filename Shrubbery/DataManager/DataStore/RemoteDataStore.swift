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

class RemoteDataStore: DataStore {
    var service: RemoteService!

    init(remote service: RemoteService) {
        self.service = service
    }

    func fetchFakeList() -> Single<FakeEntity> {
        return string(.get, URL(string: "")!)
            .observeOn(MainScheduler.instance)
            .flatMap { response -> Observable<FakeEntity> in
                let obj = FakeEntity()

                if let a = response.data(using: String.Encoding.utf8) {
                    let json = JSON(a)

                    obj.infos = json["infos"].arrayValue.flatMap { data in
                        let entity = FakeEntity.InformationEntity()

                        entity.id = data["id"].intValue
                        entity.title = data["title"].stringValue
                        entity.updated_at = data["updated_at"].stringValue

                        return entity
                    }
                }

                return Observable.just(obj)
            }.asSingle()
    }
}