//
//  NameBasedUUIDTests.swift
//  FirebladeUUIDTests
//
//  Created by Christian Treffs on 13.01.21.
//

import FirebladeUUID
import XCTest

final class NameBasedUUIDTests: XCTestCase {
    /// The UUIDs generated at different times from the same name in the same namespace MUST be equal.
    func testDifferentTimesSameNameEqual() {
        let uuid01 = UUID(name: "Name", namespace: UUID.Namespace.DNS)
        XCTAssertEqual(uuid01, UUID(uuidString: "D3204A62-8DE1-4BC7-929E-F30743F5FF2A"))

        let uuid02 = UUID(name: "Space", namespace: UUID.Namespace.OID)
        XCTAssertEqual(uuid02, UUID(uuidString: "0D5B5261-0010-41B5-A0AF-050BABA2468B"))

        XCTAssertNotEqual(uuid01, uuid02)
    }

    /// The UUIDs generated from two different names in the same namespace should be different (with very high probability).
    func testDifferentNamesSameSpaceNotEqual() {
        let uuid01 = UUID(name: "Name01", namespace: UUID.Namespace.DNS)
        let uuid02 = UUID(name: "Name02", namespace: UUID.Namespace.DNS)

        XCTAssertNotEqual(uuid01, uuid02)
    }

    /// The UUIDs generated from the same name in two different namespaces should be different with (very high probability).
    func testSameNamesDifferentSpacesNotEqual() {
        let uuid01 = UUID(name: "A name", namespace: UUID.Namespace.OID)
        let uuid02 = UUID(name: "A name", namespace: UUID.Namespace.X500)

        XCTAssertNotEqual(uuid01, uuid02)
    }

    ///  If two UUIDs that were generated from names are equal, then they were generated from the same name in the same namespace (with very high probability).
    func testSameNameSameSpacesEqual() {
        let uuid01 = UUID(name: "Same name", namespace: UUID.Namespace.DNS)
        let uuid02 = UUID(name: "Same name", namespace: UUID.Namespace.DNS)
        XCTAssertEqual(uuid01, uuid02)
    }

    func testNamespaceDefinitions() {
        XCTAssertEqual(UUID.Namespace.DNS,
                       UUID(uuidString: "6ba7b810-9dad-11d1-80b4-00c04fd430c8"))

        XCTAssertEqual(UUID.Namespace.URL,
                       UUID(uuidString: "6ba7b811-9dad-11d1-80b4-00c04fd430c8"))

        XCTAssertEqual(UUID.Namespace.OID,
                       UUID(uuidString: "6ba7b812-9dad-11d1-80b4-00c04fd430c8"))

        XCTAssertEqual(UUID.Namespace.X500,
                       UUID(uuidString: "6ba7b814-9dad-11d1-80b4-00c04fd430c8"))
    }
}
