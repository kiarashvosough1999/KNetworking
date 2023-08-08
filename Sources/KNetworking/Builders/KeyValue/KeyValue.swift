//
//  KeyValue.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/24/23.
//

public struct KeyValue {

    internal let key: String
    internal let value: Any

    public init(key: String = "", value: Any) {
        self.key = key
        self.value = value
    }
}
