import Testing

import Slipstream

struct PopoverTests {
  @Test func withManualState() throws {
    try #expect(renderHTML(Div {}.popover(.manual)) == #"<div popover="manual"></div>"#)
  }

  @Test func withAutoState() throws {
    try #expect(renderHTML(Div {}.popover(.auto)) == #"<div popover="auto"></div>"#)
  }

  @Test func withDefaultTrue() throws {
    try #expect(renderHTML(Div {}.popover()) == #"<div popover="auto"></div>"#)
  }

  @Test func withExplicitTrue() throws {
    try #expect(renderHTML(Div {}.popover(true)) == #"<div popover="auto"></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.popover(false)) == #"<div></div>"#)
  }
}
