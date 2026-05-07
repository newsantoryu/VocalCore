// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VocalCore",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "VocalCore",
            targets: ["VocalCore"]),
    ],
    targets: [
        .target(
            name: "VocalCore"),
        .testTarget(
            name: "VocalCoreTests",
            dependencies: ["VocalCore"]
        ),
    ]
)