//
//  Entity.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/18.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

protocol Entity {
}

extension Entity {
    func toShowAll() {
        let reflected = Mirror(reflecting: self)

        // Show all information.
        for case let (label?, value) in reflected.children {
            switch value {
                case let entity as Entity:
                    entity.toShowAll()
                case let array as Array<Any>:
                    logd("\(label) : \(type(of: unwrap(any: value)))")
                    for (index, item) in (value as! Array<Any>).enumerated() {
                        logw("\(index) :")
                        (item as! Entity).toShowAll()
                    }
                default:
                    logd("\(label) : \(unwrap(any: value))")
            }
        }
    }

    private func extractArray(array: [Any]) -> String {
        let content = [String: String]()

        for (index, value) in array.enumerated() {
            content[String(index)] = {
                switch value {
                    case let entity as Entity:
                        entity
                    default:
                        return unwrap(any: valuei)
                }
            }
        }
    }
}