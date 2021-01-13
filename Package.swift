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
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "FirebladeUUID",
            targets: ["FirebladeUUID"])
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-crypto.git", from: "1.1.3")],
    targets: [
        .target(
            name: "FirebladeUUID",
            dependencies: [.product(name: "Crypto", package: "swift-crypto")],
            swiftSettings: swiftSettings),
        .testTarget(
            name: "FirebladeUUIDTests",
            dependencies: ["FirebladeUUID"])
    ],
    swiftLanguageVersions: [.v5]
)
