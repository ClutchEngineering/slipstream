import Testing
import Slipstream

@Suite("Visibility Tests")
@available(iOS 17.0, macOS 14.0, *)
struct VisibilityTests {
  @Test("Visible visibility")
  func visible() throws {
    try #expect(
      renderHTML(Div {}.visibility(.visible)) ==
      #"<div class="visible"></div>"#
    )
  }

  @Test("Invisible visibility")
  func invisible() throws {
    try #expect(
      renderHTML(Div {}.visibility(.invisible)) ==
      #"<div class="invisible"></div>"#
    )
  }

  @Test("Collapse visibility")
  func collapse() throws {
    try #expect(
      renderHTML(Div {}.visibility(.collapse)) ==
      #"<div class="collapse"></div>"#
    )
  }

  @Test("Visibility with condition")
  func condition() throws {
    try #expect(
      renderHTML(
        Div {}.visibility(.invisible, condition: .init(startingAt: .medium))
      ) ==
      #"<div class="md:invisible"></div>"#
    )
  }

  @Test("Visibility with multiple conditions")
  func multipleConditions() throws {
    try #expect(
      renderHTML(
        Div {}
          .visibility(.invisible, condition: .init(startingAt: .medium))
          .visibility(.visible, condition: .init(startingAt: .large))
      ) ==
      #"<div class="md:invisible lg:visible"></div>"#
    )
  }
}
