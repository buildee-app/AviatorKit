// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AviatorKit",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "AviatorKit",
      targets: ["AviatorKit"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "3.0.0")),
  ],
  targets: [
    .target(
      name: "AviatorKit"),
    .testTarget(
      name: "AviatorKitTests",
      dependencies: ["AviatorKit", "Mocker"],
      resources: [.process("Fixtures")]
    ),
  ]
)
