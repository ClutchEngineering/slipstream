import Testing
import Slipstream

struct FontWeightTests {
  @Test func enumFontWeights() throws {
    try #expect(renderHTML(Div {}.fontWeight(.thin)) == #"<div class="font-thin"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.extraLight)) == #"<div class="font-extralight"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.light)) == #"<div class="font-light"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.normal)) == #"<div class="font-normal"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.medium)) == #"<div class="font-medium"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.semiBold)) == #"<div class="font-semibold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.bold)) == #"<div class="font-bold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.extraBold)) == #"<div class="font-extrabold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(.black)) == #"<div class="font-black"></div>"#)
  }

  @Test func numericalFontWeights() throws {
    try #expect(renderHTML(Div {}.fontWeight(50)) == #"<div class="font-thin"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(100)) == #"<div class="font-thin"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(150)) == #"<div class="font-thin"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(200)) == #"<div class="font-extralight"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(250)) == #"<div class="font-extralight"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(300)) == #"<div class="font-light"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(350)) == #"<div class="font-light"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(400)) == #"<div class="font-normal"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(450)) == #"<div class="font-normal"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(500)) == #"<div class="font-medium"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(550)) == #"<div class="font-medium"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(600)) == #"<div class="font-semibold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(650)) == #"<div class="font-semibold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(700)) == #"<div class="font-bold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(750)) == #"<div class="font-bold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(800)) == #"<div class="font-extrabold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(850)) == #"<div class="font-extrabold"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(900)) == #"<div class="font-black"></div>"#)
    try #expect(renderHTML(Div {}.fontWeight(950)) == #"<div class="font-black"></div>"#)
  }
}
