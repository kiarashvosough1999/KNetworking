//
//  BodyBuilder.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

import Foundation

@resultBuilder
public struct BodyBuilder {
    
    public static func buildBlock(_ components: KeyValue...) -> Data? {
        let body = components
            .filter { $0.isEmpty == false }
            .reduce(into: [String: Any]()) { partialResult, keyValue in
                partialResult[keyValue.key] = keyValue.value
            }
        return try? JSONSerialization.data(withJSONObject: body)
    }

    public static func buildBlock(_ components: Encodable...) -> Data? {
        let body = components
            .compactMap { try? JSONEncoder().encode($0) }
            .reduce(into: Data()) { partialResult, newData in
                partialResult.append(newData)
            }
        return body.isEmpty ? nil : body
    }

    public static func buildBlock(_ components: Data?...) -> Data? {
        let body = components
            .compactMap { $0 }
            .reduce(into: Data()) { partialResult, newData in
                partialResult.append(newData)
            }
        return body.isEmpty ? nil : body
    }
    
    public static func buildEither(first component: Data?) -> Data? {
        component
    }

    public static func buildEither(second component: Data?) -> Data? {
        component
    }
}
