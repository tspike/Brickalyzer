//
//  RebrickableModels.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import Alamofire

struct RebrickableSets: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [RebrickableSet]
}

struct RebrickableSet: Codable {
    var setID: Int {
        if let i = Int(setNum) {
            return i
        }
        if let suffixBegin = setNum.firstIndex(of: "-") {
            if let i = Int(setNum.prefix(upTo: suffixBegin)) {
                return i
            }
        }
        return 0
    }
    let name: String
    let partCount: Int

    let msrp: Decimal? = nil
    
    let parts: [LegoPart]? = nil
    
    let setNum: String
    let year, themeID: Int
    let setImageURL: String
    let setURL: String
    let lastModifiedDt: String?
    
    enum CodingKeys: String, CodingKey {
        case setNum = "set_num"
        case name, year
        case themeID = "theme_id"
        case partCount = "num_parts"
        case setImageURL = "set_img_url"
        case setURL = "set_url"
        case lastModifiedDt = "last_modified_dt"
    }
}

extension LegoSet {
    static func fromRebrickableSet(_ set: RebrickableSet) -> LegoSet? {
        return LegoSet(setID: set.setID, name: set.name, partCount: set.partCount, msrp: set.msrp, parts: set.parts)
    }

    func merged(with rebrickableSet: RebrickableSet, overwrite: Bool = false) -> LegoSet {
        let setID = overwrite ? rebrickableSet.setID : self.setID
        let name = overwrite ? rebrickableSet.name : self.name
        let partCount = overwrite ? rebrickableSet.partCount : self.partCount
        let msrp = overwrite ? rebrickableSet.msrp : (self.msrp ?? rebrickableSet.msrp)
        let parts = overwrite ? rebrickableSet.parts : (self.parts ?? rebrickableSet.parts)
        return LegoSet(setID: setID, name: name, partCount: partCount, msrp: msrp, parts: parts)
    }
}
