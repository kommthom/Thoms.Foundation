//
//  DictionaryWrapper.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 01.07.24.
//

//import Foundation
//
//@propertyWrapper
//public struct DictionaryWrapper<Key: Sendable & Hashable & RawRepresentable, Value: Sendable & Codable>: Sendable, Codable where Key.RawValue: Sendable & Codable & Hashable {
//    public var wrappedValue: [Key: Value]
//
//    public init() {
//        wrappedValue = [:]
//    }
//
//    public init(wrappedValue: [Key: Value]) {
//        self.wrappedValue = wrappedValue
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let rawKeyedDictionary = try container.decode([Key.RawValue: Value].self)
//
//        wrappedValue = [:]
//        for (rawKey, value) in rawKeyedDictionary {
//            guard let key = Key(rawValue: rawKey) else {
//                throw DecodingError.dataCorruptedError(
//                    in: container,
//                    debugDescription: "Invalid key: cannot initialize '\(Key.self)' from invalid '\(Key.RawValue.self)' value '\(rawKey)'")
//            }
//            wrappedValue[key] = value
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        let rawKeyedDictionary = Dictionary(uniqueKeysWithValues: wrappedValue.map { ($0.rawValue, $1) })
//        var container = encoder.singleValueContainer()
//        try container.encode(rawKeyedDictionary)
//    }
//}
