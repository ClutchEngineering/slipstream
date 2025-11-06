import Foundation
import Testing

import Slipstream

struct BidirectionalOverrideTests {
  @Test func leftToRight() throws {
    try #expect(renderHTML(BidirectionalOverride(.leftToRight) {
      DOMString("Hello World")
    }) == #"<bdo dir="ltr">Hello World</bdo>"#)
  }

  @Test func rightToLeft() throws {
    try #expect(renderHTML(BidirectionalOverride(.rightToLeft) {
      DOMString("مرحبا")
    }) == #"<bdo dir="rtl">مرحبا</bdo>"#)
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(BidirectionalOverride("Test", direction: .leftToRight)) == #"<bdo dir="ltr">Test</bdo>"#)
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(BidirectionalOverride(.rightToLeft) {
      Strong("Strong Text")
    }) == #"<bdo dir="rtl"><strong>Strong Text</strong></bdo>"#)
  }

  @Test func withModifiers() throws {
    try #expect(renderHTML(BidirectionalOverride("Text", direction: .leftToRight)
      .id("override-text")
      .className("rtl-override")) == #"<bdo dir="ltr" id="override-text" class="rtl-override">Text</bdo>"#)
  }

  @Test func withLanguage() throws {
    try #expect(renderHTML(BidirectionalOverride(.rightToLeft) {
      DOMString("العربية")
    }.language("ar")) == #"<bdo dir="rtl" lang="ar">العربية</bdo>"#)
  }
}
