//
//  GateWays.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/13/23.
//

import Foundation

/// Gateways of application to send and receive data
public protocol GateWays {
    func get() throws -> URL
}

extension GateWays where Self: RawRepresentable, Self.RawValue == String {

    public func get() throws -> URL {
        guard let url = URL(string: rawValue) else { throw NetworkError.apiURLException }
        return url
    }
}
