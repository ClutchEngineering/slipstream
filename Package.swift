// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "slipstream",
  platforms: [
    .macOS("14"),
    .iOS("17"),
  ],
  products: [
    // Executable can't share the same name as the library, or we get compiler errors due to conflicts of the two products.
    .executable(name: "slipstreamcli", targets: ["SlipstreamCLI"]),
    .library(name: "Slipstream", targets: ["Slipstream"])
  ],
  dependencies: [
    .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.7.3"),
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
  ],
  targets: [
    .executableTarget(name: "SlipstreamCLI", dependencies: [
      "Slipstream",
    ]),

    .target(name: "Slipstream", dependencies: [
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
