//
//  BricksetModels.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/2/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation



//struct RebrickableSets: Codable {
//    let count: Int
//    let next: String
//    let previous: JSONNull?
//    let results: [RebrickableSet]
//}

struct BricksetSet: Codable {
//    enum CodingKeys: String, CodingKey {
//        case setNum = "set_num"
//        case name, year
//        case themeID = "theme_id"
//        case partCount = "num_parts"
//        case setImgURL = "set_img_url"
//        case setURL = "set_url"
//        case lastModifiedDt = "last_modified_dt"
//    }
}

extension LegoSet {
    static func fromBricksetSet(_ set: BricksetSet) -> LegoSet? {
//        return LegoSet(setID: set.setID, name: set.name, partCount: set.partCount, msrp: set.msrp, parts: set.parts)
        return nil
    }

//    func merged(with bricksetSet: BricksetSet, overwrite: Bool = false) -> LegoSet {
//        let setID = overwrite ? rebrickableSet.setID : self.setID
//        let name = overwrite ? rebrickableSet.name : self.name
//        let partCount = overwrite ? rebrickableSet.partCount : self.partCount
//        let msrp = overwrite ? rebrickableSet.msrp : (self.msrp ?? rebrickableSet.msrp)
//        let parts = overwrite ? rebrickableSet.parts : (self.parts ?? rebrickableSet.parts)
//        return LegoSet(setID: setID, name: name, partCount: partCount, msrp: msrp, parts: parts)
//    }
}
