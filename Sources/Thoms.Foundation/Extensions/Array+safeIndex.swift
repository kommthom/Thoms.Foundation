//
//  Array+safeIndex.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 17.04.24.
//

import Foundation

extension Array {
	@inlinable
	public subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }

	@inlinable
	public mutating func append(_ newElement: Element?) {
        if let element = newElement {
            self.append(element)
        }
    }
	
	@inlinable
	public mutating func append(contentsOf: [Element?]) {
        self.append(contentsOf: contentsOf.compactMap { $0 })
    }
}
