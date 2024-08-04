import Testing
import Slipstream

struct FontSmoothingTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.fontSmoothing(.antialiased)) == #"<div class="antialiased"></div>"#)
    try #expect(renderHTML(Div {}.fontSmoothing(.subpixelAntialiased)) == #"<div class="subpixel-antialiased"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(
        Div {
        }.fontSmoothing(
          .antialiased,
          condition: .init(state: .active)
        )) == #"<div class="active:antialiased"></div>"#
    )
  }
}
