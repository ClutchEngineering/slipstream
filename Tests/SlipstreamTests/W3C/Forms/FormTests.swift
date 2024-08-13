import Foundation
import Testing

import Slipstream

struct FormTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Form {}) == #"<form></form>"#)
  }

  @Test func withSubmissionMethod() throws {
    try #expect(renderHTML(Form(method: .get) {}) == #"<form method="get"></form>"#)
    try #expect(renderHTML(Form(method: .post) {}) == #"<form method="post"></form>"#)
    try #expect(renderHTML(Form(method: .dialog) {}) == #"<form method="dialog"></form>"#)
  }

  @Test func withURL() throws {
    try #expect(renderHTML(Form(url: URL(string: "/login")) {}) == #"<form action="/login"></form>"#)
  }
}
