//
//  BricksetModels.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/2/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation

func fromDictionaryValue<A>(_ d: [String: Any], name: String) -> A? {
    return d[name] as? A
}

struct BricksetSet: Codable {
    var ACMDataCount: Int?
    var additionalImageCount: Int?
    var ageMax: String?
    var ageMin: String?
    var availability: String?
    var bricksetURL: String?
    var CARetailPrice: Decimal?
    var category: String?
    var depth: String?
    var EAN: String?
    var EURetailPrice: Decimal?
    var height: String?
    var image: Bool?
    var imageFilename: String?
    var imageURL: String?
    var instructionsCount: Int?
    var largeThumbnailURL: String?
    var lastUpdated: String?
    var minifigs: Int?
    var name: String?
    var number: String?
    var numberVariant: Int?
    var owned: Bool?
    var ownedByTotal: Int?
    var packagingType: String?
    var pieces: Int?
    var qtyOwned: Int?
    var rating: Double?
    var released: Bool?
    var reviewCount: Int?
    var setID: String?
    var subtheme: String?
    var theme: String?
    var themeGroup: String?
    var thumbnailURL: String?
    var UKRetailPrice: String?
    var UPC: String?
    var USDateAddedToSAH: String?
    var USDateRemovedFromSAH: String?
    var userRating: String?
    var USRetailPrice: String?
    var wanted: Bool?
    var wantedByTotal: Int?
    var weight: String?
    var width: String?
    var year: String?

    init(ACMDataCount: Int?, additionalImageCount: Int?, ageMax: String?, ageMin: String?, availability: String?, bricksetURL: String?, CARetailPrice: Decimal?, category: String?, depth: String?, EAN: String?, EURetailPrice: Decimal?, height: String?, image: Bool?, imageFilename: String?, imageURL: String?, instructionsCount: Int?, largeThumbnailURL: String?, lastUpdated: String?, minifigs: Int?, name: String?, number: String?, numberVariant: Int?, owned: Bool?, ownedByTotal: Int?, packagingType: String?, pieces: Int?, qtyOwned: Int?, rating: Double?, released: Bool?, reviewCount: Int?, setID: String?, subtheme: String?, theme: String?, themeGroup: String?, thumbnailURL: String?, UKRetailPrice: String?, UPC: String?, USDateAddedToSAH: String?, USDateRemovedFromSAH: String?, userRating: String?, USRetailPrice: String?, wanted: Bool?, wantedByTotal: Int?, weight: String?, width: String?, year: String?) {
        self.ACMDataCount = ACMDataCount
        self.additionalImageCount = additionalImageCount
        self.ageMax = ageMax
        self.ageMin = ageMin
        self.availability = availability
        self.bricksetURL = bricksetURL
        self.CARetailPrice = CARetailPrice
        self.category = category
        self.depth = depth
        self.EAN = EAN
        self.EURetailPrice = EURetailPrice
        self.height = height
        self.image = image
        self.imageFilename = imageFilename
        self.imageURL = imageURL
        self.instructionsCount = instructionsCount
        self.largeThumbnailURL = largeThumbnailURL
        self.lastUpdated = lastUpdated
        self.minifigs = minifigs
        self.name = name
        self.number = number
        self.numberVariant = numberVariant
        self.owned = owned
        self.ownedByTotal = ownedByTotal
        self.packagingType = packagingType
        self.pieces = pieces
        self.qtyOwned = qtyOwned
        self.rating = rating
        self.released = released
        self.reviewCount = reviewCount
        self.setID = setID
        self.subtheme = subtheme
        self.theme = theme
        self.themeGroup = themeGroup
        self.thumbnailURL = thumbnailURL
        self.UKRetailPrice = UKRetailPrice
        self.UPC = UPC
        self.USDateAddedToSAH = USDateAddedToSAH
        self.USDateRemovedFromSAH = USDateRemovedFromSAH
        self.userRating = userRating
        self.USRetailPrice = USRetailPrice
        self.wanted = wanted
        self.wantedByTotal = wantedByTotal
        self.weight = weight
        self.width = width
        self.year = year
    }

    init(dictionary: [String: Any]) {
        self.ACMDataCount = fromDictionaryValue(dictionary, name: "ACMDataCount") ?? nil
        self.additionalImageCount = fromDictionaryValue(dictionary, name: "additionalImageCount") ?? nil
        self.ageMax = fromDictionaryValue(dictionary, name: "ageMax") ?? nil
        self.ageMin = fromDictionaryValue(dictionary, name: "ageMin") ?? nil
        self.availability = fromDictionaryValue(dictionary, name: "availability") ?? nil
        self.bricksetURL = fromDictionaryValue(dictionary, name: "bricksetURL") ?? nil
        self.CARetailPrice = fromDictionaryValue(dictionary, name: "CARetailPrice") ?? nil
        self.category = fromDictionaryValue(dictionary, name: "category") ?? nil
        self.depth = fromDictionaryValue(dictionary, name: "depth") ?? nil
        self.EAN = fromDictionaryValue(dictionary, name: "EAN") ?? nil
        self.EURetailPrice = fromDictionaryValue(dictionary, name: "EURetailPrice") ?? nil
        self.height = fromDictionaryValue(dictionary, name: "height") ?? nil
        self.image = fromDictionaryValue(dictionary, name: "image") ?? nil
        self.imageFilename = fromDictionaryValue(dictionary, name: "imageFilename") ?? nil
        self.imageURL = fromDictionaryValue(dictionary, name: "imageURL") ?? nil
        self.instructionsCount = fromDictionaryValue(dictionary, name: "instructionsCount") ?? nil
        self.largeThumbnailURL = fromDictionaryValue(dictionary, name: "largeThumbnailURL") ?? nil
        self.lastUpdated = fromDictionaryValue(dictionary, name: "lastUpdated") ?? nil
        self.minifigs = fromDictionaryValue(dictionary, name: "minifigs") ?? nil
        self.name = fromDictionaryValue(dictionary, name: "name") ?? nil
        self.number = fromDictionaryValue(dictionary, name: "number") ?? nil
        self.numberVariant = fromDictionaryValue(dictionary, name: "numberVariant") ?? nil
        self.owned = fromDictionaryValue(dictionary, name: "owned") ?? nil
        self.ownedByTotal = fromDictionaryValue(dictionary, name: "ownedByTotal") ?? nil
        self.packagingType = fromDictionaryValue(dictionary, name: "packagingType") ?? nil
        self.pieces = fromDictionaryValue(dictionary, name: "pieces") ?? nil
        self.qtyOwned = fromDictionaryValue(dictionary, name: "qtyOwned") ?? nil
        self.rating = fromDictionaryValue(dictionary, name: "rating") ?? nil
        self.released = fromDictionaryValue(dictionary, name: "released") ?? nil
        self.reviewCount = fromDictionaryValue(dictionary, name: "reviewCount") ?? nil
        self.setID = fromDictionaryValue(dictionary, name: "setID") ?? nil
        self.subtheme = fromDictionaryValue(dictionary, name: "subtheme") ?? nil
        self.theme = fromDictionaryValue(dictionary, name: "theme") ?? nil
        self.themeGroup = fromDictionaryValue(dictionary, name: "themeGroup") ?? nil
        self.thumbnailURL = fromDictionaryValue(dictionary, name: "thumbnailURL") ?? nil
        self.UKRetailPrice = fromDictionaryValue(dictionary, name: "UKRetailPrice") ?? nil
        self.UPC = fromDictionaryValue(dictionary, name: "UPC") ?? nil
        self.USDateAddedToSAH = fromDictionaryValue(dictionary, name: "USDateAddedToSAH") ?? nil
        self.USDateRemovedFromSAH = fromDictionaryValue(dictionary, name: "USDateRemovedFromSAH") ?? nil
        self.userRating = fromDictionaryValue(dictionary, name: "userRating") ?? nil
        self.USRetailPrice = fromDictionaryValue(dictionary, name: "USRetailPrice") ?? nil
        self.wanted = fromDictionaryValue(dictionary, name: "wanted") ?? nil
        self.wantedByTotal = fromDictionaryValue(dictionary, name: "wantedByTotal") ?? nil
        self.weight = fromDictionaryValue(dictionary, name: "weight") ?? nil
        self.width = fromDictionaryValue(dictionary, name: "width") ?? nil
        self.year = fromDictionaryValue(dictionary, name: "year") ?? nil
    }
}

extension LegoSet {
    static func fromBricksetSet(_ set: BricksetSet) -> LegoSet? {
        guard let setID = set.number,
            let name = set.name,
            let pieces = set.pieces,
            let priceString = set.USRetailPrice,
            let price = Decimal(string: priceString) else {
                return nil
        }
        var imageURL: URL? = nil
        if let imageURLString = set.imageURL {
            imageURL = URL(string: imageURLString)
        }
        return LegoSet(setID: setID, name: name, partCount: pieces, msrp: price, setImageURL: imageURL, largeThumbnailURL: set.largeThumbnailURL, thumbnailURL: set.thumbnailURL, minifigs: set.minifigs, released: set.released, subtheme: set.subtheme, theme: set.theme, themeGroup: set.themeGroup, UPC: set.UPC, year: set.year, bricksetID: set.setID, bricksetURL: set.bricksetURL, owned: set.owned, qtyOwned: set.qtyOwned, parts: [])
    }

    func merged(with bricksetSet: BricksetSet, overwrite: Bool = false) -> LegoSet {
        var bricksetPrice: Decimal? = nil
        if let priceString = bricksetSet.USRetailPrice {
            bricksetPrice = Decimal(string: priceString)
        }
        var bricksetImageURL: URL? = nil
        if let imageURLString = bricksetSet.imageURL {
            bricksetImageURL = URL(string: imageURLString)
        }
        let setID = overwrite ? (bricksetSet.number ?? self.setID) : self.setID
        let name = overwrite ? (bricksetSet.name ?? self.name) : self.name
        let partCount = overwrite ? (bricksetSet.pieces ?? self.partCount) : self.partCount
        let msrp = overwrite ? bricksetPrice : (self.msrp ?? bricksetPrice)
        let setImageURL = overwrite ? bricksetImageURL : (self.setImageURL ?? bricksetImageURL)
        let largeThumbnailURL = overwrite ? bricksetSet.largeThumbnailURL : (self.largeThumbnailURL ?? bricksetSet.largeThumbnailURL)
        let thumbnailURL = overwrite ? bricksetSet.thumbnailURL : (self.thumbnailURL ?? bricksetSet.thumbnailURL)
        let minifigs = overwrite ? bricksetSet.minifigs : (self.minifigs ?? bricksetSet.minifigs)
        let released = overwrite ? bricksetSet.released : (self.released ?? bricksetSet.released)
        let subtheme = overwrite ? bricksetSet.subtheme : (self.subtheme ?? bricksetSet.subtheme)
        let theme = overwrite ? bricksetSet.theme : (self.theme ?? bricksetSet.theme)
        let themeGroup = overwrite ? bricksetSet.themeGroup : (self.themeGroup ?? bricksetSet.themeGroup)
        let UPC = overwrite ? bricksetSet.UPC : (self.UPC ?? bricksetSet.UPC)
        let year = overwrite ? bricksetSet.year : (self.year ?? bricksetSet.year)
        let bricksetID = overwrite ? bricksetSet.setID : (self.bricksetID ?? bricksetSet.setID)
        let bricksetURL = overwrite ? bricksetSet.bricksetURL : (self.bricksetURL ?? bricksetSet.bricksetURL)
        let owned = overwrite ? bricksetSet.owned : (self.owned ?? bricksetSet.owned)
        let qtyOwned = overwrite ? bricksetSet.qtyOwned : (self.qtyOwned ?? bricksetSet.qtyOwned)

        return LegoSet(setID: setID, name: name, partCount: partCount, msrp: msrp, setImageURL: setImageURL, largeThumbnailURL: largeThumbnailURL, thumbnailURL: thumbnailURL, minifigs: minifigs, released: released, subtheme: subtheme, theme: theme, themeGroup: themeGroup, UPC: UPC, year: year, bricksetID: bricksetID, bricksetURL: bricksetURL, owned: owned, qtyOwned: qtyOwned, parts: [])
    }
}
