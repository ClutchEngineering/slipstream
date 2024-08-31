import Foundation
import Testing

import Slipstream

struct SourceTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Source(nil, colorScheme: .light)) == "")
  }

  @Test func colorSchemes() throws {
    try #expect(renderHTML(Source(URL(string: "/logo.png"), colorScheme: .light)) == #"<source srcset="/logo.png" media="(prefers-color-scheme: light)" />"#)
    try #expect(renderHTML(Source(URL(string: "/logo.png"), colorScheme: .dark)) == #"<source srcset="/logo.png" media="(prefers-color-scheme: dark)" />"#)
  }
}
