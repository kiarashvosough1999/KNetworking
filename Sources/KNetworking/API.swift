//
//  API.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/13/23.
//

import Foundation

public protocol API {
    
    var method: HTTPMethod { get }
    var gateway: GateWays { get }
    var route: String { get }

    var timeoutInterval: TimeInterval { get }
    var cachePolicy: URLRequest.CachePolicy { get }

    @KeyValueBuilder
    var headerParams: [String: Any] { get }

    @BodyBuilder
    var body: Data? { get }
    
    @KeyValueBuilder
    var query: [String: Any] { get }
    
    func asURLRequest() throws -> URLRequest
}

extension API {

    @KeyValueBuilder
    public var headerParams: [String: Any] {
        KeyValue(key: "Content-Type", value: "application/json")
        KeyValue(key: "Accept", value: "application/json")
    }

    public var timeoutInterval: TimeInterval { 60 }
    public var cachePolicy: URLRequest.CachePolicy { .returnCacheDataElseLoad }

    public var body: Data? { nil }
    public var query: [String: Any] { [:] }
    
    internal func asURLRequest() throws -> URLRequest {
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
        if query.isEmpty == false {
            
            // for those url parameter like id which has no key and come after `/`
            query
                .filter { $0.key.isEmpty }
                .map(\.value)
                .forEach { value in
                    baseURL = baseURL.appendingPathComponent("\(value)")
                }

            // for those url parameter which has key.
            let namedQueries = query.filter { $0.key.isEmpty == false }
            if namedQueries.isEmpty == false,
               var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
            {
                components.queryItems = namedQueries
                    .map { URLQueryItem(name: $0, value: "\($1)") }
                if let newURL = components.url {
                    baseURL = newURL
                }
            }
        }
    }

    private func updateBody(urlRequest: inout URLRequest) throws {
        guard let body, (method == .post || method == .patch) && body.isEmpty == false else {
           return
        }
        urlRequest.httpBody = body
    }

    private func updateHeaders(urlRequest: inout URLRequest) {
        headerParams.forEach { param in
            urlRequest.setValue("\(param.value)", forHTTPHeaderField: param.key)
        }
    }
}
