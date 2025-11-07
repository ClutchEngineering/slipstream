import Foundation
import Testing

import Slipstream

struct OutputTests {
  @Test func withContent() throws {
    try #expect(renderHTML(Output {
      DOMString("0")
    }) == "<output>0</output>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Output("42")) == "<output>42</output>")
  }

  @Test func withFor() throws {
    try #expect(renderHTML(Output(for: ["a", "b"]) {
      DOMString("0")
    }) == #"<output for="a b">0</output>"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(Output(name: "result") {
      DOMString("0")
    }) == #"<output name="result">0</output>"#)
  }

  @Test func withForAndName() throws {
    try #expect(renderHTML(Output(for: ["a", "b"], name: "result") {
      DOMString("0")
    }) == #"<output for="a b" name="result">0</output>"#)
  }

  @Test func withTextAndAttributes() throws {
    try #expect(renderHTML(Output("42", for: ["x", "y"], name: "sum")) == #"<output for="x y" name="sum">42</output>"#)
  }

  @Test func emptyFor() throws {
    try #expect(renderHTML(Output(for: []) {
      DOMString("0")
    }) == "<output>0</output>")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Output("42").language("en")) == #"<output lang="en">42</output>"#)
  }
}
