//
//  Result.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

public enum Result<T, E> {
    case success(T) //Success Case, which will always have `value` or nil.
    case failure(E) //Failure Case, which will always have `Error` or nil.
    
    // MARK: Constructors
    /// Constructs a success wrapping a `value`.
    public init(success value: T) {
        self = .success(value)
    }
    
    /// Constructs a failure wrapping an `error`.
    public init(failure error: E) {
        self = .failure(error)
    }
}



public extension Result {
    /// Returns the value if self represents a success, `nil` otherwise.
    public var value: T? {
        switch self {
        case let .success(value): return value
        case .failure: return nil
        }
    }
    
    /// Returns the error if self represents a failure, `nil` otherwise.
    public var error: E? {
        switch self {
        case .success: return nil
        case let .failure(error): return error
        }
    }
}
