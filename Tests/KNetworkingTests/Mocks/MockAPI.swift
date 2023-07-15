//
//  MockAPI.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

import Foundation
import XCTest
@testable import KNetworking

struct MockAPI: API {
    
    var method: HTTPMethod
    var gateway: GateWaysProtocol
    var route: String

    var timeoutInterval: TimeInterval
    var cachePolicy: URLRequest.CachePolicy

    var headerParams: [String: Any]

    var body: Data?
    
    var query: [String: Any]
    
    init(
        method: HTTPMethod = .get,
        gateway: GateWaysProtocol,
        route: String,
        timeoutInterval: TimeInterval = 60,
        cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad,
        headerParams: [String : Any] = [:],
        body: Data? = nil,
        query: [String : Any] = [:]
    ) {
        self.method = method
        self.gateway = gateway
        self.route = route
        self.timeoutInterval = timeoutInterval
        self.cachePolicy = cachePolicy
        self.headerParams = headerParams
        self.body = body
        self.query = query
    }
}
