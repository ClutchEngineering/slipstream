import Testing

import Slipstream

struct HiddenTests {
  @Test func withHiddenState() throws {
    try #expect(renderHTML(Div {}.hidden(.hidden)) == #"<div hidden=""></div>"#)
  }

  @Test func withUntilFoundState() throws {
    try #expect(renderHTML(Div {}.hidden(.untilFound)) == #"<div hidden="until-found"></div>"#)
  }
}
