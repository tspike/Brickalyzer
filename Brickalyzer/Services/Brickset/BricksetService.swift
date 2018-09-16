//
//  BricksetService.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import XMLMapper
import Alamofire


struct MyXMLObject: XMLMappable {
    init?(map: XMLMap) {
        foo = "bar"
    }
    
    var nodeName: String!
    
    mutating func mapping(map: XMLMap) {
        foo <- map["foo"]
    }
    
    var foo: String
    
}
struct BricksetService {
    func getWSDL() {
        let soapMessage = SOAPMessage(soapAction: "ActionName", nameSpace: "ActionNameSpace")
        let soapEnvelope = SOAPEnvelope(soapMessage: soapMessage)
        Alamofire.request("https://brickset.com/api/v2.asmx", method: .post, parameters: soapEnvelope.toXML(), encoding: XMLEncoding.soap(withAction: "ActionNameSpace#ActionName"), headers: nil)
            .responseXMLObject(completionHandler: { (response: DataResponse<MyXMLObject>) in
                print(response)
            })
//        let soap = SOAPEngine()
        /*
        soap.userAgent = "Brickalyzer"
        soap.requestURL("https://brickset.com/api/v2.asmx", soapAction: "getSet")
        soap.requestURL("https://brickset.com/api/v2.asmx", soapAction: "getSet", completeWithDictionary: { (num, result) in
            guard let result = result else { return }
            print(result)
        }) { (e) in
            guard let e = e else { return }
            print(e)
        }
 */
    }
}
