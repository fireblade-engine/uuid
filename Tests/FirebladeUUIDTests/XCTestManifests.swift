#if !canImport(ObjectiveC)
    import XCTest

    extension FirebladeUUIDTests {
        // DO NOT MODIFY: This is autogenerated, use:
        //   `swift test --generate-linuxmain`
        // to regenerate.
        static let __allTests__FirebladeUUIDTests = [
            ("testInit", testInit),
            ("testString", testString),
            ("testUniqueness", testUniqueness),
        ]
    }

    extension NameBasedUUIDTests {
        // DO NOT MODIFY: This is autogenerated, use:
        //   `swift test --generate-linuxmain`
        // to regenerate.
        static let __allTests__NameBasedUUIDTests = [
            ("testDifferentNamesSameSpaceNotEqual", testDifferentNamesSameSpaceNotEqual),
            ("testDifferentTimesSameNameEqual", testDifferentTimesSameNameEqual),
            ("testNamespaceDefinitions", testNamespaceDefinitions),
            ("testSameNameSameSpacesEqual", testSameNameSameSpacesEqual),
            ("testSameNamesDifferentSpacesNotEqual", testSameNamesDifferentSpacesNotEqual),
        ]
    }

    public func __allTests() -> [XCTestCaseEntry] {
        [
            testCase(FirebladeUUIDTests.__allTests__FirebladeUUIDTests),
            testCase(NameBasedUUIDTests.__allTests__NameBasedUUIDTests),
        ]
    }
#endif
