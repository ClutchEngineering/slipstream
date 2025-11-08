import Testing

import Slipstream

struct TranslatableTests {
  @Test func withEnumYes() throws {
    try #expect(renderHTML(Div {}.translatable(.yes)) == #"<div translate="yes"></div>"#)
  }

  @Test func withEnumNo() throws {
    try #expect(renderHTML(Div {}.translatable(.no)) == #"<div translate="no"></div>"#)
  }

  @Test func withBoolTrue() throws {
    try #expect(renderHTML(Div {}.translatable(true)) == #"<div translate="yes"></div>"#)
  }

  @Test func withBoolFalse() throws {
    try #expect(renderHTML(Div {}.translatable(false)) == #"<div translate="no"></div>"#)
  }
}
