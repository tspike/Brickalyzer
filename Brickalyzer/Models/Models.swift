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

    init(dictionary: [String: Any]) {
        self.setID = fromDictionaryValue(dictionary, name: "setID")!
        self.name = fromDictionaryValue(dictionary, name: "name")!
        self.partCount = fromDictionaryValue(dictionary, name: "partCount")!
        self.msrp = fromDictionaryValue(dictionary, name: "msrp")

        self.setImageURL = fromDictionaryValue(dictionary, name: "setImageURL")
        self.largeThumbnailURL = fromDictionaryValue(dictionary, name: "largeThumbnailURL")
        self.thumbnailURL = fromDictionaryValue(dictionary, name: "thumbnailURL")
        self.minifigs = fromDictionaryValue(dictionary, name: "minifigs")
        self.released = fromDictionaryValue(dictionary, name: "released")
        self.subtheme = fromDictionaryValue(dictionary, name: "subtheme")
        self.theme = fromDictionaryValue(dictionary, name: "theme")
        self.themeGroup = fromDictionaryValue(dictionary, name: "themeGroup")
        self.UPC = fromDictionaryValue(dictionary, name: "UPC")
        self.year = fromDictionaryValue(dictionary, name: "year")

        self.bricksetID = fromDictionaryValue(dictionary, name: "bricksetID")
        self.bricksetURL = fromDictionaryValue(dictionary, name: "bricksetURL")
        self.owned = fromDictionaryValue(dictionary, name: "owned")
        self.qtyOwned = fromDictionaryValue(dictionary, name: "qtyOwned")

        self.parts = fromDictionaryValue(dictionary, name: "parts")
    }

//    static func fromDocument(_ doc: Document) -> LegoSet? {
//        return LegoSet(dictionary: doc.toDictionary())
//    }

}
