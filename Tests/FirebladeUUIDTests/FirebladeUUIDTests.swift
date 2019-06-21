import XCTest
import FirebladeUUID

class FirebladeUUIDTests: XCTestCase {
    func testExample() {
        
        let uuid = FirebladeUUID.UUID()
        
        XCTAssertNotNil(uuid)
        
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
