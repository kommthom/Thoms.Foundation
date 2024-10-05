//
//  DynamicKey.swift
//  Thoms.Foundation
//
//  Created by https://gist.github.com/craigaps
//  Adapted by Thomas Benninghaus on 03.07.24.
//

//import Foundation
///**
// ```
// // Encode a model with properties of type [String : Any]
// var propertiesContainer = container.nestedContainer(keyedBy: DynamicKey.self, forKey: .properties)
// if let properties = properties {
//     try propertiesContainer.encodeDynamicKeyValues(withDictionary: properties)
// }
// ```
//*/
//public enum AnyCodingKey: CodingKey {
//    case string(String)
//    case int(Int)
//
//    public var stringValue: String {
//        switch self {
//            case .string(let str): return str
//            case .int(let int): return String(int)
//        }
//    }
//
//    public var intValue: Int? {
//        switch self {
//            case .string(let str): return Int(str)
//            case .int(let int): return int
//        }
//    }
//
//    public init?(stringValue: String) { self = .string(stringValue) }
//    public init?(intValue: Int) { self = .int(intValue) }
//}
//
//public struct DynamicKey: CodingKey {
//    public var stringValue: String
//    public var intValue: Int? { return nil }
//
//    public init?(stringValue: String) { self.stringValue = stringValue }
//    public init?(intValue: Int) { return nil }
//}
///*
//extension KeyedEncodingContainer where Key == DynamicKey {
//    public mutating func encodeDynamicKeyValues(withDictionary dictionary: [String : Any]) throws {
//        for (key, value) in dictionary {
//            let dynamicKey = DynamicKey(stringValue: key)!
//            // Following won't work:
//            // let v = value as Encodable
//            // try propertiesContainer.encode(v, forKey: dynamicKey)
//            // Therefore require explicitly casting to the supported value type:
//            switch value {
//            case let v as String: try encode(v, forKey: dynamicKey)
//            case let v as Int: try encode(v, forKey: dynamicKey)
//            case let v as Double: try encode(v, forKey: dynamicKey)
//            case let v as Float: try encode(v, forKey: dynamicKey)
//            case let v as Bool: try encode(v, forKey: dynamicKey)
//            case let v as Encodable: try v.encode(to: self.superEncoder(forKey: dynamicKey))
//            default: print("Type \(type(of: value)) not supported")
//            }
//        }
//    }
//}
//
//extension KeyedDecodingContainer where Key == DynamicKey {
//    public func decodeDynamicKeyValues() -> [String : Any] {
//        var dict = [String : Any]()
//        for key in allKeys {
//            // Once again, following decode doesn't work, therefore requires explicitly decoding each supported type.
//            // propertiesContainer.decode(?, forKey: key)
//            if let v = try? decode(String.self, forKey: key) {
//                dict[key.stringValue] = v
//            } else if let v = try? decode(Bool.self, forKey: key) {
//                dict[key.stringValue] = v
//            } else if let v = try? decode(Int.self, forKey: key) {
//                dict[key.stringValue] = v
//            } else if let v = try? decode(Double.self, forKey: key) {
//                dict[key.stringValue] = v
//            } else if let v = try? decode(Float.self, forKey: key) {
//                dict[key.stringValue] = v
//            } else {
//                print("Key \(key.stringValue) type not supported")
//            }
//        }
//        return dict
//    }
// 
//    public func decodeDynamicKeyValues<T: CodingKey>(exclude keyedBy: T.type) -> [String : Any] {
//        var dict = [String : Any]()
//        for key in allKeys {
//           // Filter out CodingKey
//           if keyedBy.init(stringValue: key.stringValue) == nil
//           {
//              // Once again, following decode doesn't work, therefore requires explicitly decoding each supported type.
//              // propertiesContainer.decode(?, forKey: key)
//              if let v = try? decode(String.self, forKey: key) {
//                  dict[key.stringValue] = v
//              } else if let v = try? decode(Bool.self, forKey: key) {
//                  dict[key.stringValue] = v
//              } else if let v = try? decode(Int.self, forKey: key) {
//                  dict[key.stringValue] = v
//              } else if let v = try? decode(Double.self, forKey: key) {
//                  dict[key.stringValue] = v
//              } else if let v = try? decode(Float.self, forKey: key) {
//                  dict[key.stringValue] = v
//              } else {
//                print("Key \(key.stringValue) type not supported")
//              }
//           }
//        }
//        return dict
//    }
//}
//*/
