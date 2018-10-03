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

        let rebrickableService = RebrickableService()
        rebrickableService.getSet(setID: setID, completion: { result, error in
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
//        bricksetService.getSet(setID: setID, completion: { result, error in
//        })

    }
    func fetchSet(upc: String, completion: ((LegoSet?, Error?) -> Void)) {
        
    }
    func fetchSets(query: String, completion: (([LegoSet]?, Error?) -> Void)) {
        
    }
}
