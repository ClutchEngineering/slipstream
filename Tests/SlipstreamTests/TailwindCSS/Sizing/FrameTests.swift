import Testing
import Slipstream

struct FrameTests {
  @Test func width() throws {
    try #expect(renderHTML(Div {}.frame(width: 0))      == #"<div class="w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 1))      == #"<div class="w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 2))      == #"<div class="w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 3))      == #"<div class="w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 4))      == #"<div class="w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 5))      == #"<div class="w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.083))  == #"<div class="w-1/12"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.125))  == #"<div class="w-1/6"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.3333)) == #"<div class="w-1/3"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.5))    == #"<div class="w-1/2"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.6666)) == #"<div class="w-2/3"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.75))   == #"<div class="w-3/4"></div>"#)
    try #expect(renderHTML(Div {}.frame(width: 0.875))  == #"<div class="w-5/6"></div>"#)
  }

  @Test func height() throws {
    try #expect(renderHTML(Div {}.frame(height: 0))       == #"<div class="h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 1))       == #"<div class="h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 2))       == #"<div class="h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 3))       == #"<div class="h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 4))       == #"<div class="h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 5))       == #"<div class="h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.083))   == #"<div class="h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.125))   == #"<div class="h-1/6"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.3333))  == #"<div class="h-1/3"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.5))     == #"<div class="h-1/2"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.6666))  == #"<div class="h-2/3"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.75))    == #"<div class="h-3/4"></div>"#)
    try #expect(renderHTML(Div {}.frame(height: 0.875))   == #"<div class="h-5/6"></div>"#)
  }

  @Test func minWidth() throws {
    try #expect(renderHTML(Div {}.frame(minWidth: 0))       == #"<div class="min-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 1))       == #"<div class="min-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 2))       == #"<div class="min-w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 3))       == #"<div class="min-w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 4))       == #"<div class="min-w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 5))       == #"<div class="min-w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.083))   == #"<div class="min-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.125))   == #"<div class="min-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.3333))  == #"<div class="min-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.5))     == #"<div class="min-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.6666))  == #"<div class="min-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.75))    == #"<div class="min-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minWidth: 0.875))   == #"<div class="min-w-px"></div>"#)
  }

  @Test func minHeight() throws {
    try #expect(renderHTML(Div {}.frame(minHeight: 0))       == #"<div class="min-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 1))       == #"<div class="min-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 2))       == #"<div class="min-h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 3))       == #"<div class="min-h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 4))       == #"<div class="min-h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 5))       == #"<div class="min-h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.083))   == #"<div class="min-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.125))   == #"<div class="min-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.3333))  == #"<div class="min-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.5))     == #"<div class="min-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.6666))  == #"<div class="min-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.75))    == #"<div class="min-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(minHeight: 0.875))   == #"<div class="min-h-px"></div>"#)
  }

  @Test func maxWidth() throws {
    try #expect(renderHTML(Div {}.frame(maxWidth: 0))       == #"<div class="max-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 1))       == #"<div class="max-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 2))       == #"<div class="max-w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 3))       == #"<div class="max-w-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 4))       == #"<div class="max-w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 5))       == #"<div class="max-w-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.083))   == #"<div class="max-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.125))   == #"<div class="max-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.3333))  == #"<div class="max-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.5))     == #"<div class="max-w-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.6666))  == #"<div class="max-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.75))    == #"<div class="max-w-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxWidth: 0.875))   == #"<div class="max-w-px"></div>"#)
  }

  @Test func maxHeight() throws {
    try #expect(renderHTML(Div {}.frame(maxHeight: 0))       == #"<div class="max-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 1))       == #"<div class="max-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 2))       == #"<div class="max-h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 3))       == #"<div class="max-h-0.5"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 4))       == #"<div class="max-h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 5))       == #"<div class="max-h-1"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.083))   == #"<div class="max-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.125))   == #"<div class="max-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.3333))  == #"<div class="max-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.5))     == #"<div class="max-h-0"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.6666))  == #"<div class="max-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.75))    == #"<div class="max-h-px"></div>"#)
    try #expect(renderHTML(Div {}.frame(maxHeight: 0.875))   == #"<div class="max-h-px"></div>"#)
  }
}
