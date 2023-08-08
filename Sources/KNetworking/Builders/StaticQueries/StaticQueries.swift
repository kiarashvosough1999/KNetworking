//
//  StaticQueries.swift
//  
//
//  Created by Kiarash Vosough on 8/8/23.
//

public enum StaticQueries {

    case afterDynamicQueries(String)
    case beforeDynamicQueries(String)
    
    internal var after: Bool {
        switch self {
        case .afterDynamicQueries:
            return true
        default: return false
        }
    }
    
    internal var before: Bool {
        switch self {
        case .beforeDynamicQueries:
            return true
        default: return false
        }
    }

    internal var query: String {
        switch self {
        case .afterDynamicQueries(let query), .beforeDynamicQueries(let query):
            return query
        }
    }
}
