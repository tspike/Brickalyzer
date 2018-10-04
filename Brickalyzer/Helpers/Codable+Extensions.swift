//
//  Codable+Extensions.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/3/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
