import Testing
import Slipstream

struct OverflowTests {
  @Test func options() throws {
    try #expect(renderHTML(Div {}.overflow(.auto)) == #"<div class="overflow-auto"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.hidden)) == #"<div class="overflow-hidden"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.clip)) == #"<div class="overflow-clip"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.visible)) == #"<div class="overflow-visible"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.scroll)) == #"<div class="overflow-scroll"></div>"#)
  }

  @Test func xAxis() throws {
    try #expect(renderHTML(Div {}.overflow(.auto, axis: .x)) == #"<div class="overflow-x-auto"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.hidden, axis: .x)) == #"<div class="overflow-x-hidden"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.clip, axis: .x)) == #"<div class="overflow-x-clip"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.visible, axis: .x)) == #"<div class="overflow-x-visible"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.scroll, axis: .x)) == #"<div class="overflow-x-scroll"></div>"#)
  }

  @Test func yAxis() throws {
    try #expect(renderHTML(Div {}.overflow(.auto, axis: .y)) == #"<div class="overflow-y-auto"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.hidden, axis: .y)) == #"<div class="overflow-y-hidden"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.clip, axis: .y)) == #"<div class="overflow-y-clip"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.visible, axis: .y)) == #"<div class="overflow-y-visible"></div>"#)
    try #expect(renderHTML(Div {}.overflow(.scroll, axis: .y)) == #"<div class="overflow-y-scroll"></div>"#)
  }

  @Test func clipsToBounds() throws {
    try #expect(renderHTML(Div {}.clipsToBounds()) == #"<div class="overflow-hidden"></div>"#)
  }
}
