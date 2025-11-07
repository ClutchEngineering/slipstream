import Testing

import Slipstream

struct DraggableTests {
  @Test func withDefaultTrue() throws {
    try #expect(renderHTML(Div {}.draggable()) == #"<div draggable="true"></div>"#)
  }

  @Test func withExplicitTrue() throws {
    try #expect(renderHTML(Div {}.draggable(true)) == #"<div draggable="true"></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.draggable(false)) == #"<div draggable="false"></div>"#)
  }
}
