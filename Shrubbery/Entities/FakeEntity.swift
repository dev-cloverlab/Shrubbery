//
//  FakeEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper

struct FakeEntity: Entity, Mappable {
    var infoList: [InformationEntity]?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        infoList <- map["infos"]
    }

    struct InformationEntity: Entity, Mappable {
        var id: Int?
        var title: String?
        var updatedAt: Date?

        init?(map: Map) {
        }

        mutating func mapping(map: Map) {
            id <- map["map"]
            title <- map["title"]
            updatedAt <- (map["updated_at"], DateTransform())
        }
    }
}