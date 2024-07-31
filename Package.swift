// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "slipstream",
  targets: [
    .executableTarget(name: "slipstream"),
    .testTarget(name: "slipstreamTests", dependencies: [
      "slipstream",
    ])
  ]
)
