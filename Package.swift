// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "slipstream",
  platforms: [
    .macOS("14"),
    .iOS("17"),
  ],
  products: [
    .library(name: "Slipstream", targets: ["Slipstream"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
    .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.8.7"),
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
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
