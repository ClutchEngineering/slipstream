import Foundation
import Testing

import Slipstream

struct BidirectionalIsolateTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(BidirectionalIsolate {}) == "<bdi></bdi>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(BidirectionalIsolate("User123")) == "<bdi>User123</bdi>")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(BidirectionalIsolate {
      Strong("Important")
    }) == "<bdi><strong>Important</strong></bdi>")
  }

  @Test func withModifiers() throws {
    try #expect(renderHTML(BidirectionalIsolate("User123")
      .id("username")
      .className("user-display")) == #"<bdi id="username" class="user-display">User123</bdi>"#)
  }

  @Test func withLanguage() throws {
    try #expect(renderHTML(BidirectionalIsolate("שלום")
      .language("he")) == #"<bdi lang="he">שלום</bdi>"#)
  }
}
