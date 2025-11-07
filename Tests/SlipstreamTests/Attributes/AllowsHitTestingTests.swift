import Testing

import Slipstream

struct AllowsHitTestingTests {
  @Test func withDefaultTrue() throws {
    try #expect(renderHTML(Div {}.allowsHitTesting()) == #"<div></div>"#)
  }

  @Test func withExplicitTrue() throws {
    try #expect(renderHTML(Div {}.allowsHitTesting(true)) == #"<div></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.allowsHitTesting(false)) == #"<div inert=""></div>"#)
  }
}
