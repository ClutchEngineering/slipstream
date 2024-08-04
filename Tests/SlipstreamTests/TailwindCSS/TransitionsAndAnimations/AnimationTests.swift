import Testing
import Slipstream

struct AnimationTests {
  @Test func timingFunctions() throws {
    try #expect(renderHTML(Div {}.animation(.linear)) == #"<div class="duration-150 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.easeIn)) == #"<div class="duration-150 ease-in"></div>"#)
    try #expect(renderHTML(Div {}.animation(.easeOut)) == #"<div class="duration-150 ease-out"></div>"#)
    try #expect(renderHTML(Div {}.animation(.easeInOut)) == #"<div class="duration-150 ease-in-out"></div>"#)
  }

  @Test func customDurations() throws {
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.0))) == #"<div class="duration-0 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.1))) == #"<div class="duration-100 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.15))) == #"<div class="duration-150 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.2))) == #"<div class="duration-200 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.3))) == #"<div class="duration-300 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.4))) == #"<div class="duration-500 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.5))) == #"<div class="duration-500 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.6))) == #"<div class="duration-500 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.7))) == #"<div class="duration-700 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.8))) == #"<div class="duration-700 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 0.9))) == #"<div class="duration-1000 ease-linear"></div>"#)
    try #expect(renderHTML(Div {}.animation(.linear(duration: 1.0))) == #"<div class="duration-1000 ease-linear"></div>"#)
  }
}
