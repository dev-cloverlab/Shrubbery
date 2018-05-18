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
        // OPTIMIZE: (jieyi 2018/05/18) There's a better way for replacing multiple characters.
        logi(extractSelf(self: self)
            .replacingOccurrences(of: "\\", with: "")
            .replacingOccurrences(of: "\"", with: ""))
    }

    private func extractSelf(self entity: Entity) -> String {
        let mirror = Mirror(reflecting: entity)
        var content = [String: String]()

        for case let (label?, value) in mirror.children {
            content["'\(label)'"] = {
                switch value {
                    case let again as Entity:
                        return extractSelf(self: again)
                    case let array as Array<Any>:
                        return extractArray(array: array)
                    default:
                        return String(describing: unwrap(any: value))
                }
            }()
        }

        return String(describing: content)
    }

    private func extractArray(array: [Any]) -> String {
        var content = [String: String]()

        for (index, value) in array.enumerated() {
            content[String(index)] = {
                switch value {
                    case let entity as Entity:
                        return extractSelf(self: entity)
                    default:
                        return String(describing: unwrap(any: value))
                }
            }()
        }

        return String(describing: content)
    }
}
