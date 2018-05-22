//
//  FakeEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper

struct FakeEntity {
    var infoList: [InformationEntity]?
}

extension FakeEntity: Entity {
    static let INFOS = "infos"
}

extension FakeEntity: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        infoList <- map[FakeEntity.INFOS]
    }
}
