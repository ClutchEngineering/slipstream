import Testing

import Slipstream

struct SliderTests {
  @Test func basic() throws {
    try #expect(renderHTML(Slider()) == #"<input type="range" min="0.0" max="100.0" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(Slider(name: "volume")) == #"<input type="range" name="volume" min="0.0" max="100.0" />"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(Slider(value: 50)) == #"<input type="range" value="50.0" min="0.0" max="100.0" />"#)
  }

  @Test func withCustomRange() throws {
    try #expect(renderHTML(Slider(min: 0, max: 10)) == #"<input type="range" min="0.0" max="10.0" />"#)
  }

  @Test func withStep() throws {
    try #expect(renderHTML(Slider(step: 5)) == #"<input type="range" min="0.0" max="100.0" step="5.0" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(Slider(id: "brightness")) == #"<input type="range" min="0.0" max="100.0" id="brightness" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(Slider(autoFocus: true)) == #"<input type="range" min="0.0" max="100.0" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(Slider(name: "opacity", value: 75, min: 0, max: 100, step: 5, id: "opacity-slider", autoFocus: true)) == #"<input type="range" name="opacity" value="75.0" min="0.0" max="100.0" step="5.0" id="opacity-slider" autofocus />"#)
  }

  @Test func volumeControlUseCase() throws {
    // Test a common use case for volume control
    try #expect(renderHTML(Slider(name: "volume", value: 50, min: 0, max: 100, step: 1)) == #"<input type="range" name="volume" value="50.0" min="0.0" max="100.0" step="1.0" />"#)
  }
}
