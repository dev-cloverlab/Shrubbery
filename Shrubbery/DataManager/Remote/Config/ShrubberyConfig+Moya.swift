//
//  ShrubberyMoyaService.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Moya

enum ShrubberyMoyaConfig {
    case retrieveFakeList
}

extension ShrubberyMoyaConfig: TargetType {
    public var baseURL: URL {
        return URL(string: "http://172.16.31.166:3000")!
    }
    public var path: String {
        switch self {
            case .retrieveFakeList:
                return "/api/v1/info/list"
        }
    }
    public var method: Moya.Method {
        switch self {
            case .retrieveFakeList:
                return .get
        }
    }
    public var task: Task {
        switch self {
            case .retrieveFakeList:  // Doesn't need the parameters.
                return .requestPlain
        }
    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    public var sampleData: Data {
        switch self {
            case .retrieveFakeList:
                return "{\"id\": 123, \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".data(using: .utf8)!
        }
    }
}
