import Testing

import Slipstream

struct ZIndexTests {
  @Test func standardZIndexValues() throws {
    try #expect(renderHTML(Div {}.zIndex(0)) == #"<div class="z-0"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(10)) == #"<div class="z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(20)) == #"<div class="z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(30)) == #"<div class="z-30"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(40)) == #"<div class="z-40"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(50)) == #"<div class="z-50"></div>"#)
  }

  @Test func auto() throws {
    try #expect(renderHTML(Div {}.zIndex(.auto)) == #"<div class="z-auto"></div>"#)
  }

  @Test func negativeZIndexValues() throws {
    try #expect(renderHTML(Div {}.zIndex(-10)) == #"<div class="-z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-20)) == #"<div class="-z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-30)) == #"<div class="-z-30"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-40)) == #"<div class="-z-40"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-50)) == #"<div class="-z-50"></div>"#)
  }

  @Test func roundingToNearestValue() throws {
    // Values should round to nearest Tailwind class
    try #expect(renderHTML(Div {}.zIndex(5)) == #"<div class="z-0"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(8)) == #"<div class="z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(15)) == #"<div class="z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(18)) == #"<div class="z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(25)) == #"<div class="z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(35)) == #"<div class="z-30"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(45)) == #"<div class="z-40"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(100)) == #"<div class="z-50"></div>"#)
  }

  @Test func negativeRounding() throws {
    // Negative values should also round to nearest
    try #expect(renderHTML(Div {}.zIndex(-5)) == #"<div class="-z-0"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-15)) == #"<div class="-z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-25)) == #"<div class="-z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(-100)) == #"<div class="-z-50"></div>"#)
  }

  @Test func withConditions() throws {
    try #expect(renderHTML(Div {}.zIndex(10, condition: .init(startingAt: .large))) == #"<div class="lg:z-10"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(20, condition: .within(Breakpoint.small..<Breakpoint.large))) == #"<div class="max-lg:z-20"></div>"#)
    try #expect(renderHTML(Div {}.zIndex(.auto, condition: .init(startingAt: .medium))) == #"<div class="md:z-auto"></div>"#)
  }

  @Test func repeatedZIndexModifications() throws {
    try #expect(renderHTML(Div {}.zIndex(10).zIndex(20)) == #"<div class="z-10 z-20"></div>"#)
  }

  @Test func integerLiteralSupport() throws {
    let zIndexValue: ZIndexValue = 10
    try #expect(renderHTML(Div {}.zIndex(zIndexValue)) == #"<div class="z-10"></div>"#)
  }
}
