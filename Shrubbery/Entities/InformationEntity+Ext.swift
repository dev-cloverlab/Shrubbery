//
//  InformationEntity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/21.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CoreData
import RxCoreData
import RealmSwift
import ObjectMapper

struct InformationEntity {
    var id: Int?
    var title: String?
    var updatedAt: Date?
}

typealias INFO = InformationEntity

extension INFO: Entity {
    static let ID = "id"
    static let TITLE = "title"
    static let UPDATE_DATE = "updated_at"
}

// MARK: Object Mapper
extension INFO: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id <- map[INFO.ID]
        title <- map[INFO.TITLE]
        updatedAt <- (map[INFO.UPDATE_DATE], DateTransform())
    }
}

// MARK: Core Data
extension INFO: Persistable {
    static var entityName = "Fake"
    static var primaryAttributeName = INFO.ID
    public var identity: String {
        return "shrubbery"
    }

    public init(entity: NSManagedObject) {
        id = entity.value(forKey: INFO.ID) as! Int
        title = entity.value(forKey: INFO.TITLE) as! String
        updatedAt = entity.value(forKey: INFO.UPDATE_DATE) as! Date
    }

    public func update(_ entity: NSManagedObject) {
        entity.setValue(id, forKey: INFO.ID)
        entity.setValue(title, forKey: INFO.TITLE)
        entity.setValue(updatedAt, forKey: INFO.UPDATE_DATE)

        do {
            try entity.managedObjectContext?.save()
        }
        catch {
            loge(error)
        }
    }
}
