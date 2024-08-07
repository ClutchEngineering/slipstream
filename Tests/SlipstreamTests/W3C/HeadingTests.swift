import Testing

import Slipstream

struct HeadingTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(H1 {}) == "<h1></h1>")
    try #expect(renderHTML(H2 {}) == "<h2></h2>")
    try #expect(renderHTML(H3 {}) == "<h3></h3>")
    try #expect(renderHTML(H4 {}) == "<h4></h4>")
    try #expect(renderHTML(H5 {}) == "<h5></h5>")
    try #expect(renderHTML(H6 {}) == "<h6></h6>")

    try #expect(renderHTML(Heading(level: 1) {}) == "<h1></h1>")
    try #expect(renderHTML(Heading(level: 2) {}) == "<h2></h2>")
    try #expect(renderHTML(Heading(level: 3) {}) == "<h3></h3>")
    try #expect(renderHTML(Heading(level: 4) {}) == "<h4></h4>")
    try #expect(renderHTML(Heading(level: 5) {}) == "<h5></h5>")
    try #expect(renderHTML(Heading(level: 6) {}) == "<h6></h6>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(H1 { DOMString("Hello, world!") }) == "<h1>Hello, world!</h1>")
    try #expect(renderHTML(H2 { DOMString("Hello, world!") }) == "<h2>Hello, world!</h2>")
    try #expect(renderHTML(H3 { DOMString("Hello, world!") }) == "<h3>Hello, world!</h3>")
    try #expect(renderHTML(H4 { DOMString("Hello, world!") }) == "<h4>Hello, world!</h4>")
    try #expect(renderHTML(H5 { DOMString("Hello, world!") }) == "<h5>Hello, world!</h5>")
    try #expect(renderHTML(H6 { DOMString("Hello, world!") }) == "<h6>Hello, world!</h6>")

    try #expect(renderHTML(Heading(level: 1) { DOMString("Hello, world!") }) == "<h1>Hello, world!</h1>")
    try #expect(renderHTML(Heading(level: 2) { DOMString("Hello, world!") }) == "<h2>Hello, world!</h2>")
    try #expect(renderHTML(Heading(level: 3) { DOMString("Hello, world!") }) == "<h3>Hello, world!</h3>")
    try #expect(renderHTML(Heading(level: 4) { DOMString("Hello, world!") }) == "<h4>Hello, world!</h4>")
    try #expect(renderHTML(Heading(level: 5) { DOMString("Hello, world!") }) == "<h5>Hello, world!</h5>")
    try #expect(renderHTML(Heading(level: 6) { DOMString("Hello, world!") }) == "<h6>Hello, world!</h6>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(H1 {}.language("en")) == #"<h1 lang="en"></h1>"#)
    try #expect(renderHTML(H2 {}.language("en")) == #"<h2 lang="en"></h2>"#)
    try #expect(renderHTML(H3 {}.language("en")) == #"<h3 lang="en"></h3>"#)
    try #expect(renderHTML(H4 {}.language("en")) == #"<h4 lang="en"></h4>"#)
    try #expect(renderHTML(H5 {}.language("en")) == #"<h5 lang="en"></h5>"#)
    try #expect(renderHTML(H6 {}.language("en")) == #"<h6 lang="en"></h6>"#)
  }
}
