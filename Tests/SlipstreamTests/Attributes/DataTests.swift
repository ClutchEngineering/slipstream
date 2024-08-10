import Testing

import Slipstream

struct DataTests {
  @Test func singleAttribute() throws {
    try #expect(renderHTML(HTML {}.data(["token": "abcd"])) == #"<html data-token="abcd"></html>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(renderHTML(HTML {}.data([
      "token": "abcd",
      "use-async": "true",
    ])) == #"<html data-token="abcd" data-use-async="true"></html>"#)
  }
}
