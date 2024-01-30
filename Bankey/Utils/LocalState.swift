//
//  LocalState.swift
//  Bankey
//
//  Created by Vinicios Wentz on 30/01/24.
//

import Foundation

class LocalState {
    private enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(value) {
            UserDefaults.standard.set(value, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
