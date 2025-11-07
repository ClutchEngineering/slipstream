import Testing
import Slipstream

struct VisibilityTests {
  @Test func visible() throws {
    try #expect(renderHTML(Div {}.visibility(.visible)) == #"<div class="visible"></div>"#)
  }

  @Test func invisible() throws {
    try #expect(renderHTML(Div {}.visibility(.invisible)) == #"<div class="invisible"></div>"#)
  }

  @Test func collapse() throws {
    try #expect(renderHTML(Div {}.visibility(.collapse)) == #"<div class="collapse"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(
        Div {}.visibility(.invisible, condition: .init(startingAt: .medium))
      ) == #"<div class="md:invisible"></div>"#
    )
  }

  @Test func multipleConditions() throws {
    try #expect(
      renderHTML(
        Div {}
          .visibility(.invisible, condition: .init(startingAt: .medium))
          .visibility(.visible, condition: .init(startingAt: .large))
      ) == #"<div class="md:invisible lg:visible"></div>"#
    )
  }
}
