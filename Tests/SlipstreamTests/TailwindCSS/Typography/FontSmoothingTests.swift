import Testing
import Slipstream

struct FontSmoothingTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.fontSmoothing(.antialiased)) == #"<div class="antialiased"></div>"#)
    try #expect(renderHTML(Div {}.fontSmoothing(.subpixelAntialiased)) == #"<div class="subpixel-antialiased"></div>"#)
  }
}
