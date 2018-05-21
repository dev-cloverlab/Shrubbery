//
//  InformationEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/21.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import ObjectMapper
import RxCoreData
import CoreData

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
        id <- map["id"]
        title <- map["title"]
        updatedAt <- (map["updated_at"], DateTransform())
    }
}

extension InformationEntity: Persistable {
    typealias T = NSManagedObject

    static var entityName: String {
        return "Fake"
    }
    static var primaryAttributeName: String {
        return "id"
    }
    public var identity: String {
        return "this is cool"
    }

    public init(entity: T) {
        id = entity.value(forKey: "id") as! Int
        title = entity.value(forKey: "title") as! String
        updatedAt = entity.value(forKey: "updated_at") as! Date
    }

    public func update(_ entity: T) {
        entity.setValue(id, forKey: "id")
        entity.setValue(title, forKey: "title")
        entity.setValue(updatedAt, forKey: "updated_at")

        do {
            try entity.managedObjectContext?.save()
        }
        catch let e {
            loge(e)
        }
    }
}
