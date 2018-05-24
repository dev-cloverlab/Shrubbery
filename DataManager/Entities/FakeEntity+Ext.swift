//
//  FakeEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper

public struct FakeEntity {
    typealias Infos = [Info]?

    var infoList: Infos = nil
}

extension FakeEntity: Entity {
    static let infos = "infos"
}

// MARK: - Object Mapper

extension FakeEntity: Mappable {
    public init?(map: Map) {
    }

    public mutating func mapping(map: Map) {
        self.infoList <- map[FakeEntity.infos]
    }
}
