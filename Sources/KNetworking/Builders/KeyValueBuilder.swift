//
//  KeyValueBuilder.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

public struct KeyValue {

    public static let empty = KeyValue()
    
    internal let key: String
    internal let value: Any
    internal let isEmpty: Bool

    public init(key: String = "", value: Any) {
        self.key = key
        self.value = value
        self.isEmpty = false
    }
    
    private init() {
        self.key = ""
        self.value = ""
        self.isEmpty = true
    }
}

@resultBuilder
public struct KeyValueBuilder {
    
    public static func buildBlock(_ components: KeyValue...) -> [String: Any] {
        components
            .filter { $0.isEmpty == false }
            .reduce(into: [String: Any]()) { partialResult, keyValue in
                partialResult[keyValue.key] = keyValue.value
            }
    }

    public static func buildBlock(_ components: [String: Any]...) -> [String: Any] {
        Dictionary(
            uniqueKeysWithValues: components
                .compactMap { $0 }
                .flatMap { $0 }
                .map { ($0.key, $0.value) }
        )
    }
    
    public static func buildEither(first component: [String : Any]) -> [String : Any] {
        component
    }

    public static func buildEither(second component: [String : Any]) -> [String : Any] {
        component
    }
}
