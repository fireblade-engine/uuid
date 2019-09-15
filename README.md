# Fireblade UUID

[![Build Status](https://travis-ci.com/fireblade-engine/uuid.svg?branch=master)](https://travis-ci.com/fireblade-engine/uuid)
[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[![swift version](https://img.shields.io/badge/swift-5.0-brightgreen.svg)](#)
[![platforms](https://img.shields.io/badge/platforms-%20macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20linux%20-brightgreen.svg)](#)

This is a **dependency free**, **lightweight**, **fast** and **easy to use** [RFC4122](https://tools.ietf.org/html/rfc4122) compliant  [Universally Unique Identifier (UUID)](https://en.wikipedia.org/wiki/Universally_unique_identifier) implementation.    
It is developed and maintained as part of the [Fireblade Game Engine](https://github.com/fireblade-engine) project.


## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine and provide a code example.

### 📋 Prerequisites

* [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager)
* [Swiftlint](https://github.com/realm/SwiftLint) for linting - (optional)
* [SwiftEnv](https://swiftenv.fuller.li/) for Swift version management - (optional)

### 💻 Installing

Fireblade UUID is available for all platforms that support [Swift 5.0](https://swift.org/) and higher and the [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager).

Extend the following lines in your `Package.swift` file or use it to create a new project.

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
    .package(url: "https://github.com/fireblade-engine/uuid.git", from: "1.0.0")
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

## 🏷️ Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](tags). 

## ✍️ Authors

* [Christian Treffs](https://github.com/ctreffs)

## 🔏 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
