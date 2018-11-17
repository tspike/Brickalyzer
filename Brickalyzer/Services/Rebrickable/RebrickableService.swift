//
//  RebrickableService.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import Alamofire

struct RebrickableService: AuthProvider {
    let keychainKey: String = "rebrickable"
    let baseURL = "https://rebrickable.com/api/v3/"
    let headers: HTTPHeaders = [
        "Authorization": "key \(ProcessInfo.processInfo.environment["REBRICKABLE_KEY"]!)",
        "Accept": "application/json"
    ]

    func login(username: String, password: String, completion: @escaping ((String?, Error?) -> Void)) {
        let endpoint = "users/_token/"
        let parameters: Parameters = ["username": username,
                                      "password": password]
        Alamofire.request("\(baseURL)\(endpoint)", method: .post, parameters: parameters, headers: headers)
            .responseRebrickableLoginResponse(completionHandler: { response in
                if let responseValue = response.value {
                    completion(responseValue.userToken, nil)
                    return
                }
                if let error = response.error {
                    completion(nil, error)
                    return
                }
                completion(nil, BrickError.error("Login failed"))
                return
            })
//                if result.result.isSuccess {
//                    completion?(true, nil)
//                } else {
//                    completion?(false, BrickError.error(result.result.value.debugDescription))
//                }
//                return
//            })
    }

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
            .validate(statusCode: 200..<300)
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
                print(response)
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

    @discardableResult
    func responseRebrickableLoginResponse(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<RebrickableLoginResponse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
