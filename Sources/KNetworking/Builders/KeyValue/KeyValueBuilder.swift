//
//  KeyValueBuilder.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

@resultBuilder
public struct KeyValueBuilder {
    
    public typealias Expression = KeyValuePairConvertible

    public typealias Component = [KeyValuePairConvertible]
    
    public static func buildExpression(_ expression: Expression) -> Component {
        [expression]
    }
    
    public static func buildBlock(_ children: Component...) -> Component {
        children.flatMap { $0 }
    }
    
    public static func buildBlock(_ component: Component) -> Component {
        component
    }
    
    public static func buildOptional(_ children: Component?) -> Component {
        children ?? []
    }
    
    public static func buildEither(first child: Component) -> Component {
        child
    }
    
    public static func buildEither(second child: Component) -> Component {
        child
    }
}
