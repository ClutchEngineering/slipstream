import Testing
import Slipstream

private struct MarginView: View {
  let margins: Int = 32
  var body: some View {
    Div {
    }
    .margin(.horizontal, margins)
  }
}

struct MarginTests {
  @Test func auto() throws {
    try #expect(renderHTML(Div {}.margin(.all, .auto)) == #"<div class="m-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin(.horizontal, .auto)) == #"<div class="mx-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin(.vertical, .auto)) == #"<div class="my-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin([.top, .left], .auto)) == #"<div class="ml-auto mt-auto"></div>"#)

    try #expect(renderHTML(Div {}.margin(.top, .auto)) == #"<div class="mt-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin(.left, .auto)) == #"<div class="ml-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin(.bottom, .auto)) == #"<div class="mb-auto"></div>"#)
    try #expect(renderHTML(Div {}.margin(.right, .auto)) == #"<div class="mr-auto"></div>"#)
  }

  @Test func marginEdges() throws {
    try #expect(renderHTML(Div {}.margin(8)) == #"<div class="m-2"></div>"#)
    try #expect(renderHTML(Div {}.margin(.all, 16)) == #"<div class="m-4"></div>"#)
    try #expect(renderHTML(Div {}.margin(.horizontal, 8)) == #"<div class="mx-2"></div>"#)
    try #expect(renderHTML(Div {}.margin(.vertical, 12)) == #"<div class="my-3"></div>"#)
    try #expect(renderHTML(Div {}.margin([.top, .left], 24)) == #"<div class="ml-6 mt-6"></div>"#)

    try #expect(renderHTML(Div {}.margin(.top, 0)) == #"<div class="mt-0"></div>"#)
    try #expect(renderHTML(Div {}.margin(.left, 4)) == #"<div class="ml-1"></div>"#)
    try #expect(renderHTML(Div {}.margin(.bottom, 32)) == #"<div class="mb-8"></div>"#)
    try #expect(renderHTML(Div {}.margin(.right, 64)) == #"<div class="mr-16"></div>"#)
  }

  @Test func specificMarginSizes() throws {
    try #expect(renderHTML(Div {}.margin(.top, 0)) == #"<div class="mt-0"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 0.5)) == #"<div class="mt-0"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 1)) == #"<div class="mt-0"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 2)) == #"<div class="mt-0.5"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 3)) == #"<div class="mt-0.5"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 4)) == #"<div class="mt-1"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 32)) == #"<div class="mt-8"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 64)) == #"<div class="mt-16"></div>"#)
  }

  @Test func repeatedMarginModifications() throws {
    try #expect(renderHTML(Div {}.margin(.top, 0).margin(.right, 4)) == #"<div class="mt-0 mr-1"></div>"#)
    try #expect(renderHTML(Div {}.margin(.top, 0).margin(.top, 4)) == #"<div class="mt-0 mt-1"></div>"#)
  }
}
