//
//  UUID+Extensions.swift
//
//
//  Created by Christian Treffs on 13.01.21.
//

import protocol Foundation.ContiguousBytes

extension UUID {
    public static let count: Int = 16 // https://tools.ietf.org/html/rfc4122#section-4.1

    static let zeros: UUID_t = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
}

extension UUID {
    init<C>(contiguous contiguousBytes: C) where C: ContiguousBytes {
        var uuidBytes = UUID.zeros
        let written: Int = contiguousBytes.withUnsafeBytes { data in
            withUnsafeMutableBytes(of: &uuidBytes) {
                data.copyBytes(to: $0, count: UUID.count)
            }
        }
        precondition(written == UUID.count)
        uuidBytes.6 = (uuidBytes.6 & 0x0F) | 0x40 // version https://tools.ietf.org/html/rfc4122#section-4.1.3
        uuidBytes.8 = (uuidBytes.8 & 0x3F) | 0x80 // variant https://tools.ietf.org/html/rfc4122#section-4.1.1
        self.init(uuid: uuidBytes)
    }
}
