import Testing

import Slipstream

struct AutofocusTests {
  @Test func withDefaultTrue() throws {
    try #expect(renderHTML(Div {}.autofocus()) == #"<div autofocus></div>"#)
  }

  @Test func withExplicitTrue() throws {
    try #expect(renderHTML(Div {}.autofocus(true)) == #"<div autofocus></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.autofocus(false)) == #"<div></div>"#)
  }
}
