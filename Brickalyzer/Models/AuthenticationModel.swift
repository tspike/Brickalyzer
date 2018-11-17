//
//  AuthenticationModel.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/20/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import KeychainAccess

typealias LoginHandler = (String?, Error?) -> Void
protocol AuthProvider {
    var keychainKey: String { get }
    func login(username: String, password: String, completion: @escaping LoginHandler)
}

struct Authentication {
    let keychain = Keychain(service: "io.hoodriver.brickalyzer")

    func login(authProvider: AuthProvider, username: String, password: String, completion: @escaping((Bool, Error?) -> Void)) {
        keychain["\(authProvider.keychainKey)-username"] = username
        keychain["\(authProvider.keychainKey)-password"] = password
        authProvider.login(username: username, password: password) { token, error in
            guard let token = token else {
                print(error)
                completion(false, error)
                return
            }
            self.keychain["\(authProvider.keychainKey)-token"] = token
            completion(true, nil)
            return
        }
    }

    func refreshLogin(authProvider: AuthProvider, completion: @escaping ((Bool?, Error?) -> Void)) {
        guard let username = keychain["\(authProvider.keychainKey)-username"],
            let password = keychain["\(authProvider.keychainKey)-password"] else {
                completion(false, BrickError.error("No credentials stored"))
                return
        }
        login(authProvider: authProvider, username: username, password: password, completion: completion)
    }

    private func clearCredentials(authProvider: AuthProvider) {
        keychain["\(authProvider.keychainKey)-username"] = nil
        keychain["\(authProvider.keychainKey)-password"] = nil
        keychain["\(authProvider.keychainKey)-token"] = nil
    }


    var rebrickableLoggedIn: Bool {
        return loggedIn(authProvider: RebrickableService())
    }

    var bricksetLoggedIn: Bool {
        return loggedIn(authProvider: BricksetService())
    }

    func loggedIn(authProvider: AuthProvider) -> Bool {
        guard let _ = keychain["\(authProvider.keychainKey)-token"] else {
            return false
        }
        return true
    }

}
