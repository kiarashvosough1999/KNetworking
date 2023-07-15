//
//  NetworkError.swift
//  KNetworking
//
//  Created by Kiarash Vosough on7/13/23.
//

import Foundation

public enum NetworkError: LocalizedError {

    case failedHTTPURLResponseConversion
    case apiURLException
    case requestFailed
    
    var description: String {
        switch self {
        case .failedHTTPURLResponseConversion:
            return "failed converting to HTTPURLResponse"
        case .apiURLException:
            return "Failed to create URL"
        case .requestFailed:
            return "Request Failed"
        }
    }
}
