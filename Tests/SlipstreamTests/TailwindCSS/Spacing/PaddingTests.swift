import Testing
import Slipstream

struct PaddingTests {
  @Test func paddingEdges() throws {
    try #expect(renderHTML(Div {}.padding(8)) == #"<div class="p-2"></div>"#)
    try #expect(renderHTML(Div {}.padding(.all, 16)) == #"<div class="p-4"></div>"#)
    try #expect(renderHTML(Div {}.padding(.horizontal, 8)) == #"<div class="px-2"></div>"#)
    try #expect(renderHTML(Div {}.padding(.vertical, 12)) == #"<div class="py-3"></div>"#)
    try #expect(renderHTML(Div {}.padding([.top, .left], 24)) == #"<div class="pl-6 pt-6"></div>"#)

    try #expect(renderHTML(Div {}.padding(.top, 0)) == #"<div class="pt-0"></div>"#)
    try #expect(renderHTML(Div {}.padding(.left, 4)) == #"<div class="pl-1"></div>"#)
    try #expect(renderHTML(Div {}.padding(.bottom, 32)) == #"<div class="pb-8"></div>"#)
    try #expect(renderHTML(Div {}.padding(.right, 64)) == #"<div class="pr-16"></div>"#)
  }

  @Test func specificPaddingSizes() throws {
    try #expect(renderHTML(Div {}.padding(.top, 0)) == #"<div class="pt-0"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 0.5)) == #"<div class="pt-0"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 1)) == #"<div class="pt-0"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 2)) == #"<div class="pt-0.5"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 3)) == #"<div class="pt-0.5"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 4)) == #"<div class="pt-1"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 32)) == #"<div class="pt-8"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 64)) == #"<div class="pt-16"></div>"#)
  }

  @Test func repeatedPaddingModifications() throws {
    try #expect(renderHTML(Div {}.padding(.top, 0).padding(.right, 4)) == #"<div class="pt-0 pr-1"></div>"#)
    try #expect(renderHTML(Div {}.padding(.top, 0).padding(.top, 4)) == #"<div class="pt-0 pt-1"></div>"#)
  }
}
