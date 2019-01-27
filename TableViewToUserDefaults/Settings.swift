//
//  Settings.swift
//  TableViewToUserDefaults
//
//  Created by Décio Luiz Gazzoni Filho on 27/01/19.
//  Copyright © 2019 Décio Luiz Gazzoni Filho. All rights reserved.
//

import Foundation

struct Preset: Codable {
    var name: String
    var value: Int
}

extension UserDefaults {
    func encode<T: Encodable>(_ value: T?, forKey key: String) throws {
        switch T.self {
        case is Float.Type, is Double.Type, is String.Type, is Int.Type, is Bool.Type:
            set(value!, forKey: key)
        default:
            let data = try value.map(PropertyListEncoder().encode)
            let any = data.map { try! PropertyListSerialization.propertyList(from: $0, options: [], format: nil) }
            
            set(any, forKey: key)
        }
    }
    
    func decode<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
        switch T.self {
        case is Float.Type, is Double.Type, is String.Type, is Int.Type, is Bool.Type:
            return (value(forKey: key) as! T)
        default:
            let any = object(forKey: key)
            let data = any.map { try! PropertyListSerialization.data(fromPropertyList: $0, format: .binary, options: 0) }
            
            return try data.map { try PropertyListDecoder().decode(type, from: $0) }
        }
    }
}

class Settings: NSObject {
    static let sharedInstance = Settings()
    
    private let presetsKey = "presets"
    
    private let presetsDefaults = [
        ["name": "First preset", "value": 1],
        ["name": "Second preset", "value": 2],
    ]
    
    override private init() {
        UserDefaults.standard.register(defaults: [presetsKey: presetsDefaults])
        
        super.init()
    }
    
    private func getter<T: Codable>(forKey key: String) -> T {
        let result = try! UserDefaults.standard.decode(T.self, forKey: key)
        return result!
    }
    
    private func setter<T: Codable>(_ newValue: T, forKey key: String) {
        try! UserDefaults.standard.encode(newValue, forKey: key)
    }
    
    var presets: [Preset] {
        get {
            return getter(forKey: presetsKey)
        }
        
        set {
            setter(newValue, forKey: presetsKey)
        }
    }
}
