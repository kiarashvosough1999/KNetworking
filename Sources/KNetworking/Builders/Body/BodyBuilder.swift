//
//  BodyBuilder.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

import Foundation

extension Data {
    public static let empty: Data? = nil
}

@resultBuilder
public struct BodyBuilder {
    
    public typealias Expression1 = KeyValuePairConvertible
    public typealias Expression2 = Encodable

    public typealias Component = Data?
    
    public static func buildExpression(_ expression: Expression1) -> Component {
        try? JSONSerialization.data(withJSONObject: expression)
    }
    
    public static func buildExpression(_ expression: Expression2) -> Component {
        try? JSONEncoder().encode(expression)
    }

    public static func buildBlock(_ children: Component...) -> Component {
        let data = children
            .compactMap { $0 }
            .filter { $0.isEmpty == false }
            .reduce(into: Data()) { partialResult, data in
                partialResult.append(data)
            }
        return data.isEmpty ? nil : data
    }
    
    public static func buildBlock(_ component: Component) -> Component {
        component
    }
    
    public static func buildOptional(_ children: Component?) -> Component {
        children ?? nil
    }
    
    public static func buildEither(first child: Component) -> Component {
        child
    }
    
    public static func buildEither(second child: Component) -> Component {
        child
    }
}
