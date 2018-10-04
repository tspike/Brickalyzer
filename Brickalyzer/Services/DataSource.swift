//
//  DataSource.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

struct DataSource {
    var database: Database! {
        do {
            let db = try Database(name: "brickalyzer")
            return db
        }
        catch {
            print(error)
            return nil
        }
    }

    func fetchSet(setID: String, completion: @escaping ((LegoSet?, Error?) -> Void)) {
        if let doc = database.document(withID: "Set.\(setID)") {
            completion(LegoSet.fromDocument(doc), nil)
            return
        }
        var legoSet: LegoSet?

        var rebrickableResult: (RebrickableSet?, Error?)? = nil
        var bricksetResult: (BricksetSet?, Error?)? = nil
        let rebrickableService = RebrickableService()
        func checkResults() {
            guard let rebrickableResult = rebrickableResult,
                let bricksetResult = bricksetResult else {
                    return
            }
            completion(legoSet, bricksetResult.1 ?? rebrickableResult.1)
        }
        rebrickableService.getSet(setID: setID, completion: { result, error in
            rebrickableResult = (result, error)
            defer { checkResults() }
            guard error == nil else {
                print("Failed to fetch set \(setID) from Rebrickable.\n\n\(error.debugDescription)")
                return
            }
            guard let result = result else {
                print("Failed to fetch set \(setID) from Rebrickable. Result was nil.")
                return
            }
            if legoSet == nil {
                legoSet = LegoSet.fromRebrickableSet(result)
            } else {
                legoSet = legoSet!.merged(with: result)
            }
        })

        let bricksetService = BricksetService()
        bricksetService.getSet(setID: setID, completion: { result, error in
            bricksetResult = (result, error)
            defer { checkResults() }
            guard error == nil else {
                print("Failed to fetch set \(setID) from Brickset .\n\n\(error.debugDescription)")
                return
            }
            guard let result = result else {
                print("Failed to fetch set \(setID) from Brickset. Result was nil.")
                return
            }
            if legoSet == nil {
                legoSet = LegoSet.fromBricksetSet(result)
            } else {
                legoSet = legoSet!.merged(with: result)
            }
            print(result)
            print(error)
        })

    }
    func fetchSet(upc: String, completion: ((LegoSet?, Error?) -> Void)) {
        
    }
    func fetchSets(query: String, completion: (([LegoSet]?, Error?) -> Void)) {
        
    }
}
