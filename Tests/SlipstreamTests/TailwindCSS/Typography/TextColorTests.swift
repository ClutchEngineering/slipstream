import Testing
import Slipstream

struct TextColorTests {
  @Test func darknessValues() throws {
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 0)) == #"<div class="text-white"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 50)) == #"<div class="text-red-50"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 100)) == #"<div class="text-red-100"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 200)) == #"<div class="text-red-200"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 300)) == #"<div class="text-red-300"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 400)) == #"<div class="text-red-400"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 500)) == #"<div class="text-red-500"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 600)) == #"<div class="text-red-600"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 700)) == #"<div class="text-red-700"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 800)) == #"<div class="text-red-800"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 900)) == #"<div class="text-red-900"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 950)) == #"<div class="text-red-950"></div>"#)
    try #expect(renderHTML(Div {}.textColor(.red, darkness: 1000)) == #"<div class="text-black"></div>"#)
  }
}
