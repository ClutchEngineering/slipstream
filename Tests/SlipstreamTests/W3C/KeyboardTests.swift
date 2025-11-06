import Foundation
import Testing

import Slipstream

struct KeyboardTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Keyboard {}) == "<kbd></kbd>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Keyboard("Ctrl")) == "<kbd>Ctrl</kbd>")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Keyboard {
      DOMString("Ctrl")
      DOMString("+")
      DOMString("C")
    }) == "<kbd>Ctrl+C</kbd>")
  }

  @Test func multipleKeyboardElements() throws {
    try #expect(renderHTML(Paragraph {
      DOMString("Press ")
      Keyboard("Ctrl")
      DOMString("+")
      Keyboard("C")
      DOMString(" to copy")
    }) == "<p>Press <kbd>Ctrl</kbd>+<kbd>C</kbd> to copy</p>")
  }

  @Test func nestedKeyboard() throws {
    try #expect(renderHTML(Keyboard {
      Keyboard("Ctrl")
      DOMString("+")
      Keyboard("Alt")
      DOMString("+")
      Keyboard("Del")
    }) == "<kbd><kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd></kbd>")
  }
}
