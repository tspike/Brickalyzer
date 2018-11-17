//
//  BricksetService.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import SOAPEngine64

struct BricksetService: AuthProvider {
    let keychainKey: String = "brickset"
    func soap() -> SOAPEngine {
        let soap = SOAPEngine()
        soap.userAgent = "Brickalyzer"
        soap.actionNamespaceSlash = true
        soap.version = .VERSION_1_2
        soap.responseHeader = true // use only for non standard MS-SOAP service
        soap.userAgent = "Brickalyzer"
        soap.setValue(ProcessInfo.processInfo.environment["BRICKSET_KEY"], forKey: "apiKey")
        return soap
    }

    func checkKey() {
        let soap = self.soap()
        soap.requestURL("https://brickset.com/api/v2.asmx",
                        soapAction: "https://brickset.com/api/checkKey",
                        completeWithDictionary: { statusCode, result in
                            guard let result = result as [AnyHashable: Any]? else { return }
                            print(result)
        })
        { (e) in
            guard let e = e else { return }
            print(e)
        }

    }

    func login(username: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        let soap = self.soap()
        soap.setValue(username, forKey: "username")
        soap.setValue(password, forKey: "password")
        //         orderBySpecify sort order. Valid values are Number, YearFrom, Pieces, Minifigs, Rating, UKRetailPrice, USRetailPrice, CARetailPrice, EURetailPrice, Theme, Subtheme, Name, Random. Add 'DESC' to the end to sort descending, e.g. NameDESC.
        //        soap.setValue("", forKey: "apiKey")
        //        <s:element minOccurs="0" maxOccurs="1" name="apiKey" type="s:string"/>
        //        <s:element minOccurs="0" maxOccurs="1" name="userHash" type="s:string"/>
        //        <s:element minOccurs="0" maxOccurs="1" name="SetID" type="s:string"/>
        soap.requestURL("https://brickset.com/api/v2.asmx",
                        soapAction: "https://brickset.com/api/login",
                        completeWithDictionary: { statusCode, result in
                            guard let result = result as [AnyHashable: Any]?,
                                let body = result["Body"] as? [AnyHashable: Any],
                                let loginResponse = body["loginResponse"] as? [AnyHashable: Any],
                                let loginResult = loginResponse["loginResult"] as? String
                                else {
                                    completion(nil, BrickError.error("Invalid response from Brickset"))
                                    return
                            }
                            if loginResult.contains("ERROR") {
                                completion(nil, BrickError.error(loginResult))
                                return
                            }
                            completion(loginResult, nil)
        }, failWithError: { (e) in
            guard let e = e else { return }
            completion(nil, e)
            return
        })
    }

    func getSet(setID: String, completion: ((BricksetSet?, Error?) -> Void)?) {
        let soap = self.soap()
        soap.setValue(setID, forKey: "setNumber")
        soap.setValue("", forKey: "userHash")
        soap.setValue("", forKey: "query")
        soap.setValue("", forKey: "theme")
        soap.setValue("", forKey: "subtheme")
        soap.setValue("", forKey: "year")
        soap.setValue("", forKey: "owned")
        soap.setValue("", forKey: "wanted")
        soap.setValue("", forKey: "orderBy")
        soap.setValue("1", forKey: "pageSize")
        soap.setValue("1", forKey: "pageNumber")
        soap.setValue("", forKey: "userName")
        //         orderBySpecify sort order. Valid values are Number, YearFrom, Pieces, Minifigs, Rating, UKRetailPrice, USRetailPrice, CARetailPrice, EURetailPrice, Theme, Subtheme, Name, Random. Add 'DESC' to the end to sort descending, e.g. NameDESC.
        //        soap.setValue("", forKey: "apiKey")
        //        <s:element minOccurs="0" maxOccurs="1" name="apiKey" type="s:string"/>
        //        <s:element minOccurs="0" maxOccurs="1" name="userHash" type="s:string"/>
        //        <s:element minOccurs="0" maxOccurs="1" name="SetID" type="s:string"/>
        soap.requestURL("https://brickset.com/api/v2.asmx",
                        soapAction: "https://brickset.com/api/getSets",
                        completeWithDictionary: { statusCode, result in
                            guard let result = result as [AnyHashable: Any]?,
                                let body = result["Body"] as? [AnyHashable: Any],
                                let getSetsResponse = body["getSetsResponse"] as? [AnyHashable: Any],
                                let getSetsResult = getSetsResponse["getSetsResult"] as? [AnyHashable: Any],
                                let set = getSetsResult["sets"] as? [String: Any]
                                else {
                                    completion?(nil, BrickError.error("Invalid response from Brickset"))
                                    return
                            }
                            let bs = BricksetSet(dictionary: set)
                            completion?(bs, nil)
                            print(bs)
        }, failWithError: { (e) in
            guard let e = e,
                let completion = completion
                else { return }
            completion(nil, e)
            return
        })
    }
}
