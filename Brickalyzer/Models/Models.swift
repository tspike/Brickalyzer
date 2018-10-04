//
//  Models.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

struct LegoPart: Codable {
    var partID: Int
//    var color: LegoColor
    var quantity: Int?
    var appearsIn: [Int]
}

struct LegoSet: Codable {
    public var setID: String
    public var name: String
    public var partCount: Int
    public var msrp: Decimal?

    public var setImageURL: URL?
    public var largeThumbnailURL: String?
    public var thumbnailURL: String?
    public var minifigs: Int?
    public var released: Bool?
    public var subtheme: String?
    public var theme: String?
    public var themeGroup: String?
    public var UPC: String?
    public var year: String?

    public var bricksetID: String?
    public var bricksetURL: String?
    public var owned: Bool?
    public var qtyOwned: Int?

    public var parts: [LegoPart]?

    public init(setID: String, name: String, partCount: Int, msrp: Decimal? = nil, setImageURL: URL? = nil, largeThumbnailURL: String? = nil, thumbnailURL: String? = nil, minifigs: Int? = nil, released: Bool? = nil, subtheme: String? = nil, theme: String? = nil, themeGroup: String? = nil, UPC: String? = nil, year: String? = nil, bricksetID: String? = nil, bricksetURL: String? = nil, owned: Bool? = nil, qtyOwned: Int? = nil, parts: [LegoPart]? = nil) {

        self.setID = setID
        self.name = name
        self.partCount = partCount
        self.msrp = msrp

        self.setImageURL = setImageURL
        self.largeThumbnailURL = largeThumbnailURL
        self.thumbnailURL = thumbnailURL
        self.minifigs = minifigs
        self.released = released
        self.subtheme = subtheme
        self.theme = theme
        self.themeGroup = themeGroup
        self.UPC = UPC
        self.year = year

        self.bricksetID = bricksetID
        self.bricksetURL = bricksetURL
        self.owned = owned
        self.qtyOwned = qtyOwned

        self.parts = parts
    }


    static func fromDocument(_ doc: Document) -> LegoSet? {
        let partCount = doc.int(forKey: "partCount")
        //        let parts = doc.array(forKey: "parts")
        guard let name = doc.string(forKey: "name"),
            let setID = doc.string(forKey: "setID"),
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
