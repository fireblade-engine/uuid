// swift-tools-version:5.1

import PackageDescription

let swiftSettings: [SwiftSetting]?
#if canImport(Foundation)
    swiftSettings = nil
#else
    swiftSettings = [.define("USE_FRB_UUID")]
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
            targets: ["FirebladeUUID"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-crypto.git", from: "3.8.1")],
    targets: [
        .target(
            name: "FirebladeUUID",
            dependencies: [.product(name: "Crypto", package: "swift-crypto")],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FirebladeUUIDTests",
            dependencies: ["FirebladeUUID"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
