# Fireblade UUID

![CI](https://github.com/fireblade-engine/uuid/workflows/CI/badge.svg)
[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[![swift version](https://img.shields.io/badge/swift-5.1+-brightgreen.svg)](#)
[![platforms](https://img.shields.io/badge/platforms-%20macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20linux%20-brightgreen.svg)](#)

This is a **Swift** implementation of [Universally Unique Identifier (UUID)](https://en.wikipedia.org/wiki/Universally_unique_identifier); it's **lightweight**, **fast** and **easy to use**, and complies with [RFC4122](https://tools.ietf.org/html/rfc4122).

The module is developed and maintained as part of the [Fireblade Game Engine](https://github.com/fireblade-engine) project.


## 🚀 Getting Started

These instructions will get your copy of the project up and running on your local machine and provides a code example.

### 📋 Prerequisites

* [Swift 5.1+](https://swift.org/)
* [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager)
* [Swiftlint](https://github.com/realm/SwiftLint) for linting - (optional)
* [SwiftEnv](https://swiftenv.fuller.li/) for Swift version management - (optional)

### 💻 Installing

Fireblade UUID is available for all platforms that support [Swift 5.1+](https://swift.org/) and higher and the [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager).

Extend the following lines in your `Package.swift` file or use it to create a new project.

```swift
// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
    .package(url: "https://github.com/fireblade-engine/uuid.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: ["FirebladeUUID"])
    ]
)

```

## 📝 Code Example

```swift
// create a UUID
let uuid = UUID()

// print a string representation
print(uuid.uuidString)

```

## ✍️ Authors

This project is currently maintained by [Christian Treffs](https://github.com/ctreffs).   
See also the list of [contributors](https://github.com/fireblade-engine/uuid/contributors) who participated in this project.

## 🔏 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


## ♻ Alternatives

- [alexdrone/PushID](https://github.com/alexdrone/PushID)
- [coderyi/YiUUID](https://github.com/coderyi/YiUUID)
- [DavidSkrundz/UUID](https://github.com/DavidSkrundz/UUID)
- [drichardson/SwiftyUUID](https://github.com/drichardson/SwiftyUUID)
- [dtop/SwiftUUIDv5](https://github.com/dtop/SwiftUUIDv5)
- [swift-extras/swift-extras-uuid](https://github.com/swift-extras/swift-extras-uuid)
- [ocworld/UUIDStringStyle](https://github.com/ocworld/UUIDStringStyle)
- [PureSwift/CUUID](https://github.com/PureSwift/CUUID)
- [Swift-UUID](https://github.com/x43x61x69/Swift-UUID)
- [uuid-kit](https://github.com/baarde/uuid-kit)
- [uuid-swift](https://github.com/jrikhof/short-uuid-swift)
- [nuekodory/Swift-UUIDv3-UUIDv5](https://github.com/nuekodory/Swift-UUIDv3-UUIDv5)
- [WeZZard/UUID](https://github.com/WeZZard/UUID)
- [ZewoGraveyard/UUID](https://github.com/ZewoGraveyard/UUID)
