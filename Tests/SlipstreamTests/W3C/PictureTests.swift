import Foundation
import Testing

import Slipstream

struct PictureTests {
  @Test func emptyContent() throws {
    try #expect(renderHTML(Picture { }) == "<picture></picture>")
  }
}
