import Testing
import Slipstream

struct PointerStyleTests {
  @Test func basicPointerStyles() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.automatic)) == #"<div class="cursor-auto"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.default)) == #"<div class="cursor-default"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.pointer)) == #"<div class="cursor-pointer"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.wait)) == #"<div class="cursor-wait"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.text)) == #"<div class="cursor-text"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.move)) == #"<div class="cursor-move"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.help)) == #"<div class="cursor-help"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.notAllowed)) == #"<div class="cursor-not-allowed"></div>"#)
  }

  @Test func specialPointerStyles() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.none)) == #"<div class="cursor-none"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.contextMenu)) == #"<div class="cursor-context-menu"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.progress)) == #"<div class="cursor-progress"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.cell)) == #"<div class="cursor-cell"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.crosshair)) == #"<div class="cursor-crosshair"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.verticalText)) == #"<div class="cursor-vertical-text"></div>"#)
  }

  @Test func actionPointerStyles() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.alias)) == #"<div class="cursor-alias"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.copy)) == #"<div class="cursor-copy"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.noDrop)) == #"<div class="cursor-no-drop"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.grab)) == #"<div class="cursor-grab"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.grabbing)) == #"<div class="cursor-grabbing"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.allScroll)) == #"<div class="cursor-all-scroll"></div>"#)
  }

  @Test func resizePointerStyles() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.columnResize)) == #"<div class="cursor-col-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.rowResize)) == #"<div class="cursor-row-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northResize)) == #"<div class="cursor-n-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.eastResize)) == #"<div class="cursor-e-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.southResize)) == #"<div class="cursor-s-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.westResize)) == #"<div class="cursor-w-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northEastResize)) == #"<div class="cursor-ne-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northWestResize)) == #"<div class="cursor-nw-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.southEastResize)) == #"<div class="cursor-se-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.southWestResize)) == #"<div class="cursor-sw-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.eastWestResize)) == #"<div class="cursor-ew-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northSouthResize)) == #"<div class="cursor-ns-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northEastSouthWestResize)) == #"<div class="cursor-nesw-resize"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.northWestSouthEastResize)) == #"<div class="cursor-nwse-resize"></div>"#)
  }

  @Test func zoomPointerStyles() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.zoomIn)) == #"<div class="cursor-zoom-in"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.zoomOut)) == #"<div class="cursor-zoom-out"></div>"#)
  }

  @Test func withCondition() throws {
    try #expect(renderHTML(Div {}.pointerStyle(.pointer, condition: .hover)) == #"<div class="hover:cursor-pointer"></div>"#)
    try #expect(renderHTML(Div {}.pointerStyle(.notAllowed, condition: .dark)) == #"<div class="dark:cursor-not-allowed"></div>"#)
  }
}