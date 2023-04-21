//
//  UUID+Name.swift
//
//
//  Created by Christian Treffs on 13.01.21.
//

import Crypto

public extension UUID {
    init(name: String, namespace: UUID) {
        var hasher = Crypto.Insecure.SHA1()
        hasher.update(uuidBytes: namespace.uuid)
        hasher.update(collection: name.utf8)
        self.init(contiguous: hasher.finalize())
    }
}

public extension UUID {
    /// UUID Namespace
    ///
    /// <https://tools.ietf.org/html/rfc4122#appendix-C>
    enum Namespace {}
}

public extension UUID.Namespace {
    /// Name string is a fully-qualified domain name
    ///
    /// `6ba7b810-9dad-11d1-80b4-00c04fd430c8`
    static let DNS = UUID(uuid: UUID_t(0x6B, 0xA7, 0xB8, 0x10, 0x9D, 0xAD, 0x11, 0xD1, 0x80, 0xB4, 0x00, 0xC0, 0x4F, 0xD4, 0x30, 0xC8))

    /// Name string is a URL
    ///
    /// `6ba7b811-9dad-11d1-80b4-00c04fd430c8`
    static let URL = UUID(uuid: UUID_t(0x6B, 0xA7, 0xB8, 0x11, 0x9D, 0xAD, 0x11, 0xD1, 0x80, 0xB4, 0x00, 0xC0, 0x4F, 0xD4, 0x30, 0xC8))

    /// Name string is an ISO OID
    ///
    /// `6ba7b812-9dad-11d1-80b4-00c04fd430c8`
    static let OID = UUID(uuid: UUID_t(0x6B, 0xA7, 0xB8, 0x12, 0x9D, 0xAD, 0x11, 0xD1, 0x80, 0xB4, 0x00, 0xC0, 0x4F, 0xD4, 0x30, 0xC8))

    /// Name string is an X.500 DN (in DER or a text output format)
    ///
    /// `6ba7b814-9dad-11d1-80b4-00c04fd430c8`
    static let X500 = UUID(uuid: UUID_t(0x6B, 0xA7, 0xB8, 0x14, 0x9D, 0xAD, 0x11, 0xD1, 0x80, 0xB4, 0x00, 0xC0, 0x4F, 0xD4, 0x30, 0xC8))
}
