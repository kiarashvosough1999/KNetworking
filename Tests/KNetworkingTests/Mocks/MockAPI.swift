//
//  MockAPI.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

import Foundation
import KNetworking

struct MockAPI: API {
    
    var method: HTTPMethod
    var gateway: GateWaysProtocol
    var route: String

    var timeoutInterval: TimeInterval
    var cachePolicy: URLRequest.CachePolicy

    var headerParams: [KeyValuePairConvertible]

    var body: Data?
    
    var queries: [KeyValuePairConvertible]
    var pathComponents: [String]
    
    init(
        method: HTTPMethod = .get,
        gateway: GateWaysProtocol,
        route: String,
        timeoutInterval: TimeInterval = 60,
        cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad,
        headerParams: [KeyValuePairConvertible] = [],
        body: Data? = nil,
        queries: [KeyValuePairConvertible] = [],
        pathComponents: [String] = []
    ) {
        self.method = method
        self.gateway = gateway
        self.route = route
        self.timeoutInterval = timeoutInterval
        self.cachePolicy = cachePolicy
        self.headerParams = headerParams
        self.body = body
        self.queries = queries
        self.pathComponents = pathComponents
    }
}
