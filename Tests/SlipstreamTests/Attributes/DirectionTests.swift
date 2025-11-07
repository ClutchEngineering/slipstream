import Testing

import Slipstream

struct DirectionTests {
  @Test func withLTR() throws {
    try #expect(renderHTML(Div {}.direction(.ltr)) == #"<div dir="ltr"></div>"#)
  }

  @Test func withRTL() throws {
    try #expect(renderHTML(Div {}.direction(.rtl)) == #"<div dir="rtl"></div>"#)
  }

  @Test func withAuto() throws {
    try #expect(renderHTML(Div {}.direction(.auto)) == #"<div dir="auto"></div>"#)
  }
}
