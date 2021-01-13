//
//  Crypto+Extensions.swift
//
//
//  Created by Christian Treffs on 13.01.21.
//

import Crypto

extension HashFunction {
    mutating func update<C>(collection: C) where C: BidirectionalCollection, C.Element == UInt8 {
        collection.withContiguousStorageIfAvailable { $0.withUnsafeBytes { update(bufferPointer: $0) } }
            ?? ContiguousArray(collection).withUnsafeBytes { update(bufferPointer: $0) }
    }

    mutating func update(uuidBytes: UUID_t) {
        withUnsafeBytes(of: uuidBytes) {
            update(bufferPointer: $0)
        }
    }
}
