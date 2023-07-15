//
//  URLSession++APITask.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/13/23.
//

import Foundation

extension URLSession {

    public struct APIResponse {
        public let data: Data
        public let httpResponse: HTTPURLResponse

        public var statusCode: StatusCode {
            StatusCode(rawValue: httpResponse.statusCode) ?? .unknown
        }
        
        public func decode<M>(to modelType: M.Type) throws -> M where M: Decodable {
            try JSONDecoder().decode(modelType, from: data)
        }
    }

    public func data<A>(for api: A) async throws -> APIResponse where A: API {
        let (data, response) = try await self.data(for: try api.asURLRequest())

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.failedHTTPURLResponseConversion
        }

        return APIResponse(data: data, httpResponse: httpResponse)
    }
}
