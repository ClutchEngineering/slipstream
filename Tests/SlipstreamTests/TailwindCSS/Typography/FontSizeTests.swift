import Testing
import Slipstream

struct FontSizeTests {
  @Test func enumFontSizes() throws {
    try #expect(renderHTML(Div {}.fontSize(.extraSmall)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.small)) == #"<div class="text-sm"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.base)) == #"<div class="text-base"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.large)) == #"<div class="text-lg"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraLarge)) == #"<div class="text-xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraExtraLarge)) == #"<div class="text-2xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraExtraExtraLarge)) == #"<div class="text-3xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.fourXLarge)) == #"<div class="text-4xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.fiveXLarge)) == #"<div class="text-5xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.sixXLarge)) == #"<div class="text-6xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.sevenXLarge)) == #"<div class="text-7xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.eightXLarge)) == #"<div class="text-8xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.nineXLarge)) == #"<div class="text-9xl"></div>"#)
  }

  @Test func numericalFontSizes() throws {
    try #expect(renderHTML(Div {}.fontSize(6)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(12)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(13)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(14)) == #"<div class="text-sm"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(15)) == #"<div class="text-sm"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(16)) == #"<div class="text-base"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(17)) == #"<div class="text-base"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(18)) == #"<div class="text-lg"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(19)) == #"<div class="text-lg"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(20)) == #"<div class="text-xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(22)) == #"<div class="text-xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(24)) == #"<div class="text-2xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(30)) == #"<div class="text-3xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(36)) == #"<div class="text-4xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(48)) == #"<div class="text-5xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(60)) == #"<div class="text-6xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(72)) == #"<div class="text-7xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(96)) == #"<div class="text-8xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(128)) == #"<div class="text-9xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(200)) == #"<div class="text-9xl"></div>"#)
  }

  @Test func ExactFontSizes() throws {
    try #expect(renderHTML(Div {}.fontSize(px: 31)) == #"<div class="text-[31px]"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(
        Div {
        }.fontSize(6, condition: .init(state: .disabled))) == #"<div class="disabled:text-xs"></div>"#
    )
  }
}
