//
//  MockGateWay.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/15/23.
//

@testable import KNetworking
import Foundation

struct MockGateWay: GateWays, RawRepresentable {
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
