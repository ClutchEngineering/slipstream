import Foundation
import Testing

import Slipstream

struct BackgroundColorTests {
  @Test func color() throws {
    try #expect(renderHTML(Div {}.background(.black)) == #"<div class="bg-black"></div>"#)
    try #expect(renderHTML(Div {}.background(.white)) == #"<div class="bg-white"></div>"#)
    try #expect(renderHTML(Div {}.background(.white)) == #"<div class="bg-white"></div>"#)
  }

  @Test func colorWithDarkness() throws {
    try #expect(renderHTML(Div {}.background(.cyan, darkness: 500)) == #"<div class="bg-cyan-500"></div>"#)
  }
}
