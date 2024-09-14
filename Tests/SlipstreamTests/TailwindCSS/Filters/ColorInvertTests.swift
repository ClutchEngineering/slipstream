import Testing
import Slipstream

struct ColorInvertTests {
  @Test func applies() throws {
    try #expect(renderHTML(Div {}.colorInvert()) == #"<div class="invert"></div>"#)
  }
}
