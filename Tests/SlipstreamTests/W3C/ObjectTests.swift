import Foundation
import Testing

import Slipstream

struct ObjectTests {
  @Test func empty() throws {
    try #expect(renderHTML(Object()) == "<object></object>")
  }

  @Test func withData() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf"))) == #"<object data="/media/file.pdf"></object>"#)
  }

  @Test func withType() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf"), type: "application/pdf")) == #"<object data="/media/file.pdf" type="application/pdf"></object>"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf"), name: "myObject")) == #"<object data="/media/file.pdf" name="myObject"></object>"#)
  }

  @Test func withDimensions() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf"), width: 600, height: 400)) == #"<object data="/media/file.pdf" width="600" height="400"></object>"#)
  }

  @Test func allAttributes() throws {
    try #expect(
      renderHTML(
        Object(
          data: URL(string: "/media/file.pdf"),
          type: "application/pdf",
          name: "myPDF",
          width: 800,
          height: 600
        )
      ) == #"<object data="/media/file.pdf" type="application/pdf" name="myPDF" width="800" height="600"></object>"#
    )
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf")) {
      DOMString("Your browser doesn't support embedded PDFs.")
    }) == #"<object data="/media/file.pdf">Your browser doesn't support embedded PDFs.</object>"#)
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Object(data: URL(string: "/media/file.pdf")).language("en")) == #"<object data="/media/file.pdf" lang="en"></object>"#)
  }
}
