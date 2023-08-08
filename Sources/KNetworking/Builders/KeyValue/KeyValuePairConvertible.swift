//
//  KeyValuePairConvertible.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/24/23.
//

public protocol KeyValuePairConvertible {
    var keyValuePairs: [String: Any] { get }
}

// MARK: - Implementations

extension KeyValue: KeyValuePairConvertible {
    public var keyValuePairs: [String: Any] { [key: value] }
}

extension Dictionary: KeyValuePairConvertible where Key == String {
    public var keyValuePairs: [String: Any] { self }
}
