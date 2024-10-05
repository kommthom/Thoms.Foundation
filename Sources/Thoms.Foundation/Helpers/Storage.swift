//
//  Storage.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 01.07.24.
//

//import Foundation
//
//public struct Storage: Sendable {
//    /// The internal storage area.
//    private var storage: [ObjectIdentifier: AnyStorageValue]
//
//    struct Value<T: Sendable & Codable>: AnyStorageValue {
//        var value: T
//    }
//    
//    public init() {
//        self.storage = [:]
//    }
//
//    public mutating func clear() {
//        self.storage = [:]
//    }
//
//    /// Read/write access to values via keyed subscript.
//    public subscript<Key>(_ key: Key.Type) -> Key.Value? where Key: StorageKeyProtocol {
//        get { self.get(Key.self) }
//        set { self.set(Key.self, to: newValue)}
//    }
//
//    /// Read access to a value via keyed subscript, adding the provided default
//    /// value to the storage if the key does not already exist. The `defaultValue` autoclosure
//    /// is evaluated only when the key does not already exist in the container.
//    public subscript<Key>(_ key: Key.Type, default defaultValue: @autoclosure () -> Key.Value) -> Key.Value where Key: StorageKeyProtocol {
//        mutating get {
//            if let existing = self[key] { return existing }
//            let new = defaultValue()
//            self.set(Key.self, to: new)
//            return new
//        }
//    }
//
//    /// Test whether the given key exists in the container.
//    public func contains<Key>(_ key: Key.Type) -> Bool {
//        self.storage.keys.contains(ObjectIdentifier(Key.self))
//    }
//
//    /// Get the value of the given key if it exists and is of the proper type.
//    public func get<Key>(_ key: Key.Type) -> Key.Value? where Key: StorageKeyProtocol {
//        guard let value = self.storage[ObjectIdentifier(Key.self)] as? Value<Key.Value> else { return nil }
//        return value.value
//    }
//
//    /// Set or remove a value for a given key, optionally providing a shutdown closure for the value.
//    public mutating func set<Key>(_ key: Key.Type, to value: Key.Value?) where Key: StorageKeyProtocol {
//        let key = ObjectIdentifier(Key.self)
//        if let value = value {
//            self.storage[key] = Value(value: value)
//        } else if let _ = self.storage[key] {
//            self.storage[key] = nil
//        }
//    }
//}
//
//public protocol AnyStorageValue: Sendable, Codable {}
//
///// A key used to store values in a ``Storage`` must conform to this protocol.
//public protocol StorageKeyProtocol: CodingKeyRepresentable {
//    /// The type of the stored value associated with this key type.
//    associatedtype Value: Sendable, Codable
//}
///*
//extension ObjectIdentifier: CodingKeyRepresentable {
//    public var codingKey: any CodingKey {
//        <#code#>
//    }
//    
//    public init?<T>(codingKey: T) where T : CodingKey {
//        <#code#>
//    }
//}
//func hashString(obj: AnyObject) -> String {
//    return String(UInt(bitPattern: ObjectIdentifier(obj)))
//}
//*/
