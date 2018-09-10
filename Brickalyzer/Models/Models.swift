//
//  Models.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation

protocol LegoPart {
    var partID: Int { get }
    var color: LegoColor { get }
    var quantity: Int? { get set }
}

protocol LegoSet {
    var setID: Int { get }
    var name: String { get }
    var partCount: Int { get }
    var msrp: Decimal? { get }
    var parts: [LegoPart]? { get }
}
