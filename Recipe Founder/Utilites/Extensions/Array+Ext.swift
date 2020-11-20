//
//  Array+Ext.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
extension Array where Element: Encodable {
    func asArrayDictionary() throws -> [[String: Any]] {
        var data: [[String: Any]] = []

        for element in self {
            data.append(try element.asDictionary())
        }
        return data
    }
}

extension Encodable {
        func asDictionary() throws -> [String: Any] {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                throw NSError()
            }
            return dictionary
        }
}
