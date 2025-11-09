import Foundation
import Testing

@testable import Slipstream

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
    let expected = "body {\n  margin: 0;\n  padding: 0;\n}\n\n@layer components {\n}\n"
    #expect(output == expected)
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
    let expected = "/* Base CSS */\n\n@layer components {\n  /* TestComponent */\n  .test-component {\n    color: red;\n  }\n\n}\n"
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
    let expected = "/* Base */\n\n@layer components {\n  /* ComponentA */\n  .component-a {\n    background: blue;\n  }\n\n  /* ComponentB */\n  .component-b {\n    font-size: 16px;\n  }\n\n}\n"
    #expect(output == expected)
  }

  @Test func createsOutputDirectoryIfMissing() async throws {
    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "nested/directory/output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base */\n\n@layer components {\n}\n"
    #expect(output == expected)
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
    let expected = "/* Base */\n\n@layer components {\n  /* EmptyComponent */\n\n\n}\n"
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
    let expected = "\n\n@layer components {\n  /* TestComponent */\n  .test { color: red; }\n\n}\n"
    #expect(output == expected)
  }

  @Test func withoutComponentLayerWrapsSingleComponent() async throws {
    struct TestComponent: HasComponentCSS {
      var componentCSS: String {
"""
.test-component {
  color: blue;
}
"""
      }
      var componentName: String { "TestComponent" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base CSS */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [TestComponent()], baseCSS: baseCSSURL, to: outputURL, useComponentLayer: false)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base CSS */\n\n/* TestComponent */\n.test-component {\n  color: blue;\n}\n\n"
    #expect(output == expected)
  }

  @Test func withoutComponentLayerWrapsMultipleComponents() async throws {
    struct ComponentA: HasComponentCSS {
      var componentCSS: String {
"""
.component-a {
  background: green;
}
"""
      }
      var componentName: String { "ComponentA" }
    }

    struct ComponentB: HasComponentCSS {
      var componentCSS: String {
"""
.component-b {
  font-size: 18px;
}
"""
      }
      var componentName: String { "ComponentB" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [ComponentA(), ComponentB()], baseCSS: baseCSSURL, to: outputURL, useComponentLayer: false)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base */\n\n/* ComponentA */\n.component-a {\n  background: green;\n}\n\n/* ComponentB */\n.component-b {\n  font-size: 18px;\n}\n\n"
    #expect(output == expected)
  }

  @Test func withoutComponentLayerHandlesEmptyComponents() async throws {
    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [], baseCSS: baseCSSURL, to: outputURL, useComponentLayer: false)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    let expected = "/* Base */\n\n"
    #expect(output == expected)
  }

  @Test func deduplicatesComponentsWithIdenticalCSS() async throws {
    struct Header: HasComponentCSS {
      var componentCSS: String { ".header { background: blue; }" }
      var componentName: String { "Header" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    // Pass same component multiple times (simulating shared header across pages)
    try renderStyles(from: [Header(), Header(), Header()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    // Should only appear once, not three times
    let expected = "/* Base */\n\n@layer components {\n  /* Header */\n  .header { background: blue; }\n\n}\n"
    #expect(output == expected)
  }

  @Test func deduplicatesPreservesFirstOccurrence() async throws {
    struct ComponentA: HasComponentCSS {
      var componentCSS: String { ".shared { color: red; }" }
      var componentName: String { "ComponentA" }
    }

    struct ComponentB: HasComponentCSS {
      var componentCSS: String { ".shared { color: red; }" }  // Same CSS
      var componentName: String { "ComponentB" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    // ComponentA appears first, so its name should be used
    try renderStyles(from: [ComponentA(), ComponentB()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    // Should use "ComponentA" comment, not "ComponentB"
    #expect(output.contains("/* ComponentA */"))
    #expect(!output.contains("/* ComponentB */"))
    
    // CSS should only appear once
    let cssOccurrences = output.components(separatedBy: ".shared { color: red; }").count - 1
    #expect(cssOccurrences == 1)
  }

  @Test func deduplicationWorksWithoutComponentLayer() async throws {
    struct Header: HasComponentCSS {
      var componentCSS: String { ".header { padding: 20px; }" }
      var componentName: String { "Header" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    try renderStyles(from: [Header(), Header()], baseCSS: baseCSSURL, to: outputURL, useComponentLayer: false)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    // Should only appear once without @layer wrapper
    let expected = "/* Base */\n\n/* Header */\n.header { padding: 20px; }\n\n"
    #expect(output == expected)
  }

  @Test func deduplicationKeepsUniqueComponents() async throws {
    struct Header: HasComponentCSS {
      var componentCSS: String { ".header { color: blue; }" }
      var componentName: String { "Header" }
    }

    struct Footer: HasComponentCSS {
      var componentCSS: String { ".footer { color: gray; }" }
      var componentName: String { "Footer" }
    }

    let baseCSSURL = rootURL.appending(path: "base.css")
    let outputURL = rootURL.appending(path: "output.css")

    try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)

    // Pass Header twice, Footer once
    try renderStyles(from: [Header(), Footer(), Header()], baseCSS: baseCSSURL, to: outputURL)

    let output = try String(contentsOf: outputURL, encoding: .utf8)
    
    // Both should appear once
    #expect(output.contains("/* Header */"))
    #expect(output.contains("/* Footer */"))
    #expect(output.contains(".header { color: blue; }"))
    #expect(output.contains(".footer { color: gray; }"))
    
    // Header CSS should only appear once despite being passed twice
    let headerOccurrences = output.components(separatedBy: ".header { color: blue; }").count - 1
    #expect(headerOccurrences == 1)
  }
}
