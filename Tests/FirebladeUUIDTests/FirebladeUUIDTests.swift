import class XCTest.XCTestCase
import func XCTest.XCTAssertNotNil
import func XCTest.XCTAssertEqual
import func XCTest.XCTAssertTrue
import func XCTest.XCTAssertFalse
import func XCTest.XCTAssertNil

import FirebladeUUID

class FirebladeUUIDTests: XCTestCase {
    func testInit() {
        let uuid = UUID()
        XCTAssertNotNil(uuid)
    }

    func testUniqueness() {
        var set = Set<UUID>()
        (0..<100_000).forEach { _ in
            let (inserted, _) = set.insert(UUID())
            XCTAssertTrue(inserted)
        }
    }

    func testString() {
        let uuid = UUID()
        let string = uuid.uuidString
        XCTAssertFalse(string.isEmpty)

        let sameUUID = UUID(uuidString: string)
        XCTAssertNotNil(sameUUID)
        XCTAssertEqual(sameUUID, uuid)

        let failUUID = UUID(uuidString: "12344567890")
        XCTAssertNil(failUUID)
    }
}
