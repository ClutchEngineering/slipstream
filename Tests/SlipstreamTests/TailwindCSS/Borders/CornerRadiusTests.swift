import Testing
import Slipstream

struct CornerRadiusTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.cornerRadius(.none)) == #"<div class="rounded-none"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.small)) == #"<div class="rounded-sm"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.base)) == #"<div class="rounded"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.medium)) == #"<div class="rounded-md"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.large)) == #"<div class="rounded-lg"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.extraLarge)) == #"<div class="rounded-xl"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.extraExtraLarge)) == #"<div class="rounded-2xl"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.extraExtraExtraLarge)) == #"<div class="rounded-3xl"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(.full)) == #"<div class="rounded-full"></div>"#)
  }

  @Test func points() throws {
    try #expect(renderHTML(Div {}.cornerRadius(0)) == #"<div class="rounded-none"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(1)) == #"<div class="rounded-none"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(2)) == #"<div class="rounded-sm"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(3)) == #"<div class="rounded-sm"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(4)) == #"<div class="rounded"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(5)) == #"<div class="rounded"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(6)) == #"<div class="rounded-md"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(7)) == #"<div class="rounded-md"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(8)) == #"<div class="rounded-lg"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(9)) == #"<div class="rounded-lg"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(10)) == #"<div class="rounded-lg"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(11)) == #"<div class="rounded-xl"></div>"#)
    try #expect(renderHTML(Div {}.cornerRadius(12)) == #"<div class="rounded-xl"></div>"#)
  }
}
