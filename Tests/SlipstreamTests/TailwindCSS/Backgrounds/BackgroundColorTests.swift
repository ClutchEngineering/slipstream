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

  @Test func colorWithOpacity() throws {
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(0))) == #"<div class="bg-cyan-500/0"></div>"#)
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(0.5))) == #"<div class="bg-cyan-500/50"></div>"#)
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(20))) == #"<div class="bg-cyan-500"></div>"#)
  }
}
