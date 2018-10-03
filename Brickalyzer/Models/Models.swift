//
//  Models.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

struct LegoPart {
    var partID: Int
    var color: LegoColor
    var quantity: Int?
    var appearsIn: [Int]
}

struct LegoSet {
    public var setID: Int
    public var name: String
    public var partCount: Int
    public var msrp: Decimal?
    public var setImageURL: URL?
    public var parts: [LegoPart]?

    public init(setID: Int, name: String, partCount: Int, msrp: Decimal? = nil, setImageURL: URL? = nil, parts: [LegoPart]? = nil) {
        self.setID = setID
        self.name = name
        self.partCount = partCount
        self.msrp = msrp
        self.setImageURL = setImageURL
        self.parts = parts
    }

    static func fromDocument(_ doc: Document) -> LegoSet? {
        let setID = doc.int(forKey: "setID")
        let partCount = doc.int(forKey: "partCount")
//        let parts = doc.array(forKey: "parts")
        guard let name = doc.string(forKey: "name"),
            setID != 0,
            partCount != 0 else {
                return nil
        }
        var msrp: Decimal? = Decimal(doc.int(forKey: "msrpInCents")) / 100
        if msrp == 0 {
            msrp = nil
        }

        var setImageURL: URL? = nil
        if let setImageURLString = doc.string(forKey: "setImageURL") {
            setImageURL = URL(string: setImageURLString)
        }

        return LegoSet(setID: setID, name: name, partCount: partCount, msrp: msrp, setImageURL: setImageURL, parts: [])
    }

}
