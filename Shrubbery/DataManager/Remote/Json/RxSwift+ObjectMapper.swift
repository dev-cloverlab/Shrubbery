//
//  RxJsonToObject.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/18.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import ObjectMapper

public extension ObservableType where E == String {
    public func mapToObject<M: Mappable>(type: M.Type) -> Observable<M> {
        return flatMap { strData -> Observable<M> in
            guard let obj = Mapper<M>().map(JSONString: strData) else {
                throw RxError.noElements
            }

            return Observable.just(obj)
        }
    }
}