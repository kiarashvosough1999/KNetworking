//
//  StaticQueriesBuilder.swift
//  
//
//  Created by Kiarash Vosough on 8/8/23.
//

import Foundation

@resultBuilder
public struct StaticQueriesBuilder {
    
    public typealias Expression = StaticQueries

    public typealias Component = [StaticQueries]
    
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
