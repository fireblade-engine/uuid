// swift-tools-version:5.0

import PackageDescription

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
            dependencies: []),
        .testTarget(
            name: "FirebladeUUIDTests",
            dependencies: ["FirebladeUUID"])
    ]
)
