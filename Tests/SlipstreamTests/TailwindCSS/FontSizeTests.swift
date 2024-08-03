import Testing

import Slipstream

struct FontSizeTests {
  @Test func alignments() throws {
    try #expect(renderHTML(Div {}.fontSize(.extraSmall)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.small)) == #"<div class="text-sm"></div>"#)

    try #expect(renderHTML(Div {}.fontSize(.extraSmall)) == #"<div class="text-xs"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.small)) == #"<div class="text-sm"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.base)) == #"<div class="text-base"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.large)) == #"<div class="text-lg"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraLarge)) == #"<div class="text-xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraExtraLarge)) == #"<div class="text-2xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.extraExtraExtraLarge)) == #"<div class="text-3xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.fourXLarge)) == #"<div class="text-4xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.fiveXLarge)) == #"<div class="text-5xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.sixXLarge)) == #"<div class="text-6xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.sevenXLarge)) == #"<div class="text-7xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.eightXLarge)) == #"<div class="text-8xl"></div>"#)
    try #expect(renderHTML(Div {}.fontSize(.nineXLarge)) == #"<div class="text-9xl"></div>"#)
  }
}
