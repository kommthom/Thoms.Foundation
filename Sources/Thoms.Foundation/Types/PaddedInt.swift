//
//  PaddedInt.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 30.05.24.
//

import Foundation

public protocol PaddedInt: Codable, Hashable, Equatable, Sendable, LosslessStringConvertible {
    var intValue: Int { get set }
    var digits: Int { get set }
    
	@inlinable
	init(intValue: Int, digits: Int)
}

extension PaddedInt {
	@inlinable
	public var description: String { String(format: "%0\(self.digits)d", self.intValue) }

	@inlinable
	public init?(_ description: String) {
		guard let intValue = Int(description) else { return nil }
		self.init(intValue: intValue, digits: description.count)
	}
	
//    public init(intValue: Int, digits: Int) {
//        self.intValue = intValue
//        self.digits = digits
//    }
}

public struct DefaultPaddedInt: PaddedInt {
    public var intValue: Int
    public var digits: Int
	
	@inlinable
	public init(intValue: Int, digits: Int) {
		self.intValue = intValue
		self.digits = digits
	}
}
