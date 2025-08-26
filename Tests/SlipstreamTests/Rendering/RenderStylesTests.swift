import Foundation
import Testing

import Slipstream

final class RenderStylesTests {

  let rootURL: URL

  init() throws {
    self.rootURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)

    try FileManager.default.createDirectory(at: rootURL, withIntermediateDirectories: true)
  }

  deinit {
    try? FileManager.default.removeItem(at: rootURL)
  }

  @Test func combinesBaseCSSWithNoComponents() async throws {
    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try """
    body {
      margin: 0;
      padding: 0;
    }
    """.write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    #expect(output == """
body {
  margin: 0;
  padding: 0;
}

/* Component-specific styles */\n
""")
  }

  @Test func combinesBaseCSSWithSingleComponent() async throws {
    struct TestComponent: HasComponentCSS {
      var componentCSS: String {
"""
.test-component {
  color: red;
}
"""
      }
      var componentName: String { "TestComponent" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base CSS */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [TestComponent()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base CSS */\n\n/* Component-specific styles */\n/* TestComponent */\n.test-component {\n  color: red;\n}\n\n"
    #expect(output == expected)
  }

  @Test func combinesBaseCSSWithMultipleComponents() async throws {
    struct ComponentA: HasComponentCSS {
      var componentCSS: String {
"""
.component-a {
  background: blue;
}
"""
      }
      var componentName: String { "ComponentA" }
    }

    struct ComponentB: HasComponentCSS {
      var componentCSS: String {
"""
.component-b {
  font-size: 16px;
}
"""
      }
      var componentName: String { "ComponentB" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [ComponentA(), ComponentB()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base */\n\n/* Component-specific styles */\n/* ComponentA */\n.component-a {\n  background: blue;\n}\n\n/* ComponentB */\n.component-b {\n  font-size: 16px;\n}\n\n"
    #expect(output == expected)
  }

  @Test func createsOutputDirectoryIfMissing() async throws {
    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "nested/directory/output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    #expect(output == """
/* Base */

/* Component-specific styles */\n
""")
  }

  @Test func throwsErrorForMissingBaseCSS() async throws {
    let baseCSSURL = rootURL.appending(path: "nonexistent.css")
    let outputURL = rootURL.appending(path: "output.css")

    #expect(throws: Error.self) {
      try renderStyles(from: [], baseCSS: baseCSSURL, to: outputURL)
    }
  }

  @Test func usesDefaultComponentName() async throws {
    struct MyCustomComponent: HasComponentCSS {
      var componentCSS: String {
        ".custom { color: green; }"
      }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [MyCustomComponent()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    #expect(output.contains("/* MyCustomComponent */"))
  }

  @Test func handlesEmptyComponentCSS() async throws {
    struct EmptyComponent: HasComponentCSS {
      var componentCSS: String { "" }
      var componentName: String { "EmptyComponent" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [EmptyComponent()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base */\n\n/* Component-specific styles */\n/* EmptyComponent */\n\n\n"
    #expect(output == expected)
  }

  @Test func handlesEmptyBaseCSS() async throws {
    struct TestComponent: HasComponentCSS {
      var componentCSS: String { ".test { color: red; }" }
      var componentName: String { "TestComponent" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [TestComponent()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "\n\n/* Component-specific styles */\n/* TestComponent */\n.test { color: red; }\n\n"
    #expect(output == expected)
  }
}
