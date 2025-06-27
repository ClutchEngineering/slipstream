// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "slipstream",
  platforms: [
    .macOS(.v15),
    .iOS(.v18),
  ],
  products: [
    .library(name: "Slipstream", targets: ["Slipstream"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
    .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.8.8"),
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.4"),
  ],
  targets: [
    .target(name: "Slipstream", dependencies: [
      .product(name: "Markdown", package: "swift-markdown"),
      "SwiftSoup",
      "TypeIntrospection",
    ]),
    .testTarget(name: "SlipstreamTests", dependencies: [
      "Slipstream",
    ]),

    .target(name: "TypeIntrospection"),
    .testTarget(name: "TypeIntrospectionTests", dependencies: [
      "TypeIntrospection",
    ]),
  ]
)
