import Testing

import Slipstream

struct HiddenTests {
  @Test func withDefaultTrue() throws {
    try #expect(renderHTML(Div {}.hidden()) == #"<div hidden=""></div>"#)
  }

  @Test func withExplicitTrue() throws {
    try #expect(renderHTML(Div {}.hidden(true)) == #"<div hidden=""></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.hidden(false)) == #"<div></div>"#)
  }

  @Test func withHiddenState() throws {
    try #expect(renderHTML(Div {}.hidden(.hidden)) == #"<div hidden=""></div>"#)
  }

  @Test func withUntilFoundState() throws {
    try #expect(renderHTML(Div {}.hidden(.untilFound)) == #"<div hidden="until-found"></div>"#)
  }
}
