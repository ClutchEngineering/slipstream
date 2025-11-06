import Foundation
import Testing

import Slipstream

struct SampleOutputTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(SampleOutput {}) == "<samp></samp>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(SampleOutput("Error: File not found")) == "<samp>Error: File not found</samp>")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(SampleOutput {
      DOMString("Output: ")
      Code("result = 42")
    }) == "<samp>Output: <code>result = 42</code></samp>")
  }
}
