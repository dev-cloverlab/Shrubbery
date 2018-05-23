//
//  FakeEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper

struct FakeEntity {
    typealias Infos = [Info]?

    var infoList: Infos = nil
}

extension FakeEntity: Entity {
    static let infos = "infos"
}

// MARK: - Object Mapper
extension FakeEntity: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        infoList <- map[FakeEntity.infos]
    }
}
