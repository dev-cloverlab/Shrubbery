//
//  ShrubberyRemoteExt.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/18.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import RxAlamofire
import ObjectMapper

protocol RestHttpRequest {
}

extension RestHttpRequest {
    // TODO: (jieyi 2018/05/18) Make get request function with the parameters.

    func getRequest<T: Mappable>(uri: String, params hash: [String: Any]? = nil) -> Single<T> {
#if DEBUG
        let request = string(.get, URL(string: uri)!, parameters: hash).debug()
#else
        let request = string(.get, URL(string: uri)!, parameters: hash)
#endif
        return request.mapToObject(type: T.self).asSingle()
    }
}
