//
//  Predicate.swift
//  Thoms.Foundation
//
//  Created by Thomas Benninghaus on 22.03.24.
//

import Foundation

//typealias Predicate<T> = (T) -> Bool

public struct Predicate<Target> {
    public var matches: (Target) -> Bool

	@inlinable
	public init(matcher: @escaping (Target) -> Bool) {
        matches = matcher
    }
}

@inlinable
public func ==<T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> Predicate<T> {
    Predicate { $0[keyPath: lhs] == rhs }
}

@inlinable
public prefix func !<T>(rhs: KeyPath<T, Bool>) -> Predicate<T> {
    rhs == false
}

@inlinable
public func ><T, V: Comparable>(lhs: KeyPath<T, V>, rhs: V) -> Predicate<T> {
    Predicate { $0[keyPath: lhs] > rhs }
}

@inlinable
public func <<T, V: Comparable>(lhs: KeyPath<T, V>, rhs: V) -> Predicate<T> {
    Predicate { $0[keyPath: lhs] < rhs }
}

@inlinable
public func &&<T>(lhs: Predicate<T>, rhs: Predicate<T>) -> Predicate<T> {
    Predicate { lhs.matches($0) && rhs.matches($0) }
}

@inlinable
public func ||<T>(lhs: Predicate<T>, rhs: Predicate<T>) -> Predicate<T> {
    Predicate { lhs.matches($0) || rhs.matches($0) }
}

@inlinable
public func ~=<T, V: Collection>(lhs: KeyPath<T, V>, rhs: V.Element) -> Predicate<T> where V.Element: Equatable {
    Predicate { $0[keyPath: lhs].contains(rhs) }
}
