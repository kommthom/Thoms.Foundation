//
//  CodableColor.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 23.12.23.
//

import SwiftUI

public struct CodableColor: Sendable {
    public var wrappedValue: NSColor
    
	@inlinable
	public init(wrappedValue: NSColor) {
        self.wrappedValue = wrappedValue
    }
}

extension CodableColor: Codable {
	@inlinable
	public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        guard let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid color"
            )
        }
        wrappedValue = color
    }

	@inlinable
	public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let data = try NSKeyedArchiver.archivedData(withRootObject: wrappedValue, requiringSecureCoding: true)
        try container.encode(data)
    }
}
