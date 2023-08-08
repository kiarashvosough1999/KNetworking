//
//  API.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/13/23.
//

import Foundation

public protocol API {
    
    var method: HTTPMethod { get }
    var gateway: GateWaysProtocol { get }
    var route: String { get }

    var timeoutInterval: TimeInterval { get }
    var cachePolicy: URLRequest.CachePolicy { get }

    @KeyValueBuilder
    var headerParams: [KeyValuePairConvertible] { get }

    @BodyBuilder
    var body: Data? { get }
    
    @KeyValueBuilder
    var queries: [KeyValuePairConvertible] { get }

    var pathComponents: [String] { get }

    func asURLRequest() throws -> URLRequest
}

extension API {

    @KeyValueBuilder
    public var headerParams: [KeyValuePairConvertible] {
        KeyValue(key: "Content-Type", value: "application/json")
        KeyValue(key: "Accept", value: "application/json")
    }

    public var timeoutInterval: TimeInterval { 60 }
    public var cachePolicy: URLRequest.CachePolicy { .returnCacheDataElseLoad }

    public var body: Data? { nil }
    public var queries: [KeyValuePairConvertible] { [] }
    public var pathComponents: [String] { [] }

    public func asURLRequest() throws -> URLRequest {
        let gateway = try gateway.get()

        var url = gateway.appendingPathComponent(route)
        updateURL(baseURL: &url)

        var urlRequest = URLRequest(
            url: url,
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        urlRequest.httpMethod = method.rawValue

        try updateBody(urlRequest: &urlRequest)
        updateHeaders(urlRequest: &urlRequest)

        return urlRequest
    }

    private func updateURL(baseURL: inout URL) {
        pathComponents
            .forEach { baseURL = baseURL.appendingPathComponent($0) }
        
        guard queries.isEmpty == false, var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else { return }
        components.queryItems = queries
            .map(\.keyValuePairs)
            .flatMap { $0 }
            .map { URLQueryItem(name: $0, value: "\($1)") }
        
        if let newURL = components.url {
            baseURL = newURL
        }
    }

    private func updateBody(urlRequest: inout URLRequest) throws {
        guard let body, (method == .post || method == .patch) && body.isEmpty == false else {
           return
        }
        urlRequest.httpBody = body
    }

    private func updateHeaders(urlRequest: inout URLRequest) {
        headerParams
            .map { $0.keyValuePairs }
            .flatMap { $0 }
            .forEach({ (key, value) in
                urlRequest.setValue("\(value)", forHTTPHeaderField: key)
            })
    }
}
