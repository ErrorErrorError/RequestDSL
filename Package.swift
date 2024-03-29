// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RequestDSL",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RequestDSL",
            targets: ["RequestDSL"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "RequestDSL"),
        .testTarget(
            name: "RequestDSLTests",
            dependencies: ["RequestDSL"]
        ),
    ],
    swiftLanguageVersions: [.version("5.9"), .version("5.10")]
)
