//
//  RxJsonToObject.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/18.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import ObjectMapper

extension ObservableType where E == String {
    func mapToObject<M: Mappable>(_ type: M.Type) -> Observable<M> {
        return flatMap { strData -> Observable<M> in
            guard let obj = Mapper<M>().map(JSONString: strData) else {
                throw RxError.noElements
            }

            return Observable.just(obj)
        }
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, Element == String {
    func mapToObject<M: Mappable>(_ type: M.Type) -> Single<M> {
        return flatMap { strData -> Single<M> in
            guard let obj = Mapper<M>().map(JSONString: strData) else {
                throw RxError.noElements
            }

            return Single.just(obj)
        }
    }
}
