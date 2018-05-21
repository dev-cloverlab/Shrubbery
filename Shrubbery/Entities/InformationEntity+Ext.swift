//
//  InformationEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/21.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper

struct InformationEntity {
    var id: Int?
    var title: String?
    var updatedAt: Date?
}

extension InformationEntity: Entity {
}

extension InformationEntity: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id <- map["map"]
        title <- map["title"]
        updatedAt <- (map["updated_at"], DateTransform())
    }
}