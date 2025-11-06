import Foundation
import Testing

import Slipstream

struct BaseTests {
  @Test func emptyBase() throws {
    try #expect(renderHTML(Base()) == "<base>")
  }

  @Test func withURL() throws {
    let url = URL(string: "https://example.com/")!
    try #expect(renderHTML(Base(url: url)) == #"<base href="https://example.com/">"#)
  }

  @Test func withTarget() throws {
    try #expect(renderHTML(Base(target: "_blank")) == #"<base target="_blank">"#)
  }

  @Test func withURLAndTarget() throws {
    let url = URL(string: "https://example.com/docs/")!
    try #expect(renderHTML(Base(url: url, target: "_blank")) == #"<base href="https://example.com/docs/" target="_blank">"#)
  }

  @Test func withModifiers() throws {
    let url = URL(string: "https://example.com/")!
    try #expect(renderHTML(Base(url: url).id("base-url")) == #"<base href="https://example.com/" id="base-url">"#)
  }
}
