//
//  RebrickableService.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import Alamofire

struct RebrickableService {
    let baseURL = "https://rebrickable.com/api/v3/"
    let headers: HTTPHeaders = [
        "Authorization": "key \(ProcessInfo.processInfo.environment["REBRICKABLE_KEY"]!)",
        "Accept": "application/json"
    ]

    func getSets(page: String = "1", pageSize: String = "100", search: String? = nil, completion: (([RebrickableSet]) -> Void)?)  {
        let endpoint = "lego/sets/"
        var parameters: Parameters = ["page": page,
                                      "pageSize": pageSize]
        if let search = search {
            parameters["search"] = search
        }
        print(headers)
        Alamofire.request("\(baseURL)\(endpoint)", parameters: parameters, headers: headers)
        .responseRebrickableSets(completionHandler: { response in
            if let sets = response.result.value {
                completion?(sets.results)
                return
            }
        })
    }
    
    func getSet(setID: String, completion: ((RebrickableSet?, Error?) -> Void)?)  {
        let endpoint = "lego/sets/\(setID)/"
        Alamofire.request("\(baseURL)\(endpoint)", headers: self.headers)
            .responseJSON(completionHandler: { response in
                if response.error != nil {
                    completion?(nil, response.error)
                    return
                }
            })
            .responseRebrickableSet(completionHandler: { response in
                if let set = response.result.value {
                    completion?(set, nil)
                    return
                }
            })
    }
}

extension DataRequest {
    @discardableResult
    func responseRebrickableSets(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<RebrickableSets>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }

    @discardableResult
    func responseRebrickableSet(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<RebrickableSet>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
