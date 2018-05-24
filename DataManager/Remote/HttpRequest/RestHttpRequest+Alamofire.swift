//
//  ShrubberyRemoteExt.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/18.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper
import RxAlamofire
import RxSwift

protocol RestHttpRequest {
}

extension RestHttpRequest {
    // TODO: (jieyi 2018/05/18) Make get request function with the parameters.

    func getRequest<T: Mappable>(uri: String, params hash: [String: Any]? = nil) -> Single<T> {
        var request = string(.get, URL(string: uri)!, parameters: hash)
#if DEBUG
        request = request.debug()
#endif
        return request.mapToObject(T.self).asSingle()
    }
}

