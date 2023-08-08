//
//  MockFeature1Request.swift
//  
//
//  Created by Kiarash Vosough on 8/8/23.
//

import KNetworking
import Foundation

struct PostModel: Encodable {
    let name: String
}

enum MockFeature1Request {
    case getPosts
    case getPostsById(Int)
    case sendPosts(PostModel)
}

extension MockFeature1Request: API {

    var method: HTTPMethod {
        switch self {
        case .getPosts, .getPostsById:
            return .get
        case .sendPosts:
            return .post
        }
    }
    
    var gateway: GateWaysProtocol {
        MockGateWays.base
    }

    var route: String {
        "posts"
    }

    @KeyValueBuilder
    var headerParams: [KeyValuePairConvertible] {
        KeyValue(key: "token", value: "Bearer dnk3k345jk34nrh35th")
        KeyValue(key: "token", value: "Bearer dnk3k345jk34nrh35th")
        // Or
        switch self {
        case .getPosts:
            KeyValue(key: "key1", value: "1234")
            KeyValue(key: "key1", value: "1234")
        case .getPostsById(let int):
            KeyValue(key: "key2", value: int)
        case .sendPosts(let postModel):
            KeyValue(key: "key2", value: postModel.name)
        }
    }

    @BodyBuilder
    var body: Data? {
        Data()
        if case .sendPosts(let postModel) = self {
            postModel
        }
        KeyValue(key: "id", value: 2)
    }
    
    @KeyValueBuilder
    var queries: [KeyValuePairConvertible] {
        if case .getPostsById(let int) = self {
            KeyValue(key: "id", value: int)
        }
    }
}
