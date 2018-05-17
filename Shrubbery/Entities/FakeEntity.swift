//
//  FakeEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

class FakeEntity {
    var infos: [InformationEntity]?

    class InformationEntity {
        var id: Int?
        var title: String?
        var updated_at: String?

        init() {
        }
    }
}