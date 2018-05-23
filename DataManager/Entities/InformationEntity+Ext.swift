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

public struct InformationEntity {
    var id: Int?
    var title: String?
    var updatedAt: Date?
}

public typealias Info = InformationEntity

extension Info: Entity {
    static let entityId = "id"
    static let entityTitle = "title"
    static let updatedDate = "updated_at"
}

// MARK: Object Mapper
extension Info: Mappable {
    public init?(map: Map) {
    }

    public mutating func mapping(map: Map) {
        id <- map[Info.entityName]
        title <- map[Info.entityTitle]
        updatedAt <- (map[Info.updatedDate], DateTransform())
    }
}

// MARK: - Core Data
extension Info: Persistable {
    public static var entityName = "Fake"
    public static var primaryAttributeName = Info.entityId
    public var identity: String {
        return "shrubbery"
    }

    public init(entity: NSManagedObject) {
        id = entity.value(forKey: Info.entityId) as? Int
        title = entity.value(forKey: Info.entityTitle) as? String
        updatedAt = entity.value(forKey: Info.updatedDate) as? Date
    }

    public func update(_ entity: NSManagedObject) {
        entity.setValue(id, forKey: Info.entityId)
        entity.setValue(title, forKey: Info.entityTitle)
        entity.setValue(updatedAt, forKey: Info.updatedDate)

        do {
            try entity.managedObjectContext?.save()
        } catch {
            print(error)
        }
    }
}
