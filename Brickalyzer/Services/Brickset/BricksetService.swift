//
//  BricksetService.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import SOAPEngine64

struct BricksetService {

    func getSet(setID: String, completion: ((BricksetSet?, Error) -> Void)?) {
        let soap = SOAPEngine()
        soap.userAgent = "Brickalyzer"
        soap.requestURL("https://brickset.com/api/v2.asmx", soapAction: "getSet", completeWithDictionary: { (num, result) in
            guard let result = result else { return }
            print(result)
        }) { (e) in
            guard let e = e else { return }
            print(e)
        }
    }
}
