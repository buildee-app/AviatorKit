// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AviatorKit",
    products: [
        .library(
            name: "AviatorKit",
            targets: ["AviatorKit"]),
    ],
    targets: [
        .target(
            name: "AviatorKit"),
        .testTarget(
            name: "AviatorKitTests",
            dependencies: ["AviatorKit"]
        ),
    ]
)
