//
//  String+Split.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 05.04.24.
//

import Foundation

extension String {
	@inlinable
	public func split(separators: [String]) -> [String] {
        return separators.reduce([self]) { result, separator in
            return result.flatMap { $0.split(separator: separator).map { String($0) } }
        }
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    
	@inlinable
	public func eliminatePrefix(_ prefix: String) -> String? {
        self.hasPrefix(prefix) ? String(self.suffix(from: self.index(self.startIndex, offsetBy: prefix.count))) : nil
    }
}

/* Usage */
//"hello.there/how?are!you".split(separators: [".", "/", "?", "!"])
/* Result: ["hello", "there", "how", "are", "you"] */
