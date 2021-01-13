// swift-tools-version:5.1

import PackageDescription

let swiftSettings: [SwiftSetting]?
#if canImport(Foundation)
swiftSettings = [.define("USE_FOUNDATION_UUID")]
#else
swiftSettings = nil
#endif

let package = Package(
    name: "FirebladeUUID",
    products: [
        .library(
            name: "FirebladeUUID",
            targets: ["FirebladeUUID"])
    ],
    targets: [
        .target(
            name: "FirebladeUUID",
            swiftSettings: swiftSettings),
        .testTarget(
            name: "FirebladeUUIDTests",
            dependencies: ["FirebladeUUID"])
    ],
    swiftLanguageVersions: [.v5]
)
