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
        let docID = "Set.\(setID)"
        if let doc = database.document(withID: docID) {
            completion(LegoSet(dictionary: doc.toDictionary()), nil)
            return
        }
        var legoSet: LegoSet?

        var rebrickableResult: (RebrickableSet?, Error?)? = nil
        var bricksetResult: (BricksetSet?, Error?)? = nil
        let rebrickableService = RebrickableService()
        var pendingTasks = 2

        func checkResults() {
            guard pendingTasks == 0 else {
                return
            }
            let error = bricksetResult?.1 ?? rebrickableResult?.1
            completion(legoSet, error)
            guard error == nil else { return }
            let document = MutableDocument(id: docID, data: legoSet.dictionary)
            do {
                try database.saveDocument(document)
            } catch {
                print(error.localizedDescription)
            }
        }

        rebrickableService.getSet(setID: setID, completion: { result, error in
            pendingTasks -= 1
            rebrickableResult = (result, error)
            defer { checkResults() }
            guard error == nil else {
                print("Failed to fetch set \(setID) from Rebrickable.\n\n\(error?.localizedDescription)")
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
            pendingTasks -= 1
            bricksetResult = (result, error)
            defer { checkResults() }
            guard error == nil else {
                print("Failed to fetch set \(setID) from Brickset .\n\n\(error!.localizedDescription)")
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
//            print(result)
//            print(error)
        })

    }
    func fetchSet(upc: String, completion: ((LegoSet?, Error?) -> Void)) {
        
    }
    func fetchSets(query: String, completion: (([LegoSet]?, Error?) -> Void)) {
        
    }
}
