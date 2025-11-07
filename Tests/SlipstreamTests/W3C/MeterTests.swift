import Foundation
import Testing

import Slipstream

struct MeterTests {
  @Test func valueOnly() throws {
    try #expect(renderHTML(Meter(value: 0.5)) == #"<meter value="0.5" min="0.0" max="1.0"></meter>"#)
  }

  @Test func customMinMax() throws {
    try #expect(renderHTML(Meter(value: 50, min: 0, max: 100)) == #"<meter value="50.0" min="0.0" max="100.0"></meter>"#)
  }

  @Test func withLow() throws {
    try #expect(renderHTML(Meter(value: 0.5, low: 0.3)) == #"<meter value="0.5" min="0.0" max="1.0" low="0.3"></meter>"#)
  }

  @Test func withHigh() throws {
    try #expect(renderHTML(Meter(value: 0.5, high: 0.8)) == #"<meter value="0.5" min="0.0" max="1.0" high="0.8"></meter>"#)
  }

  @Test func withOptimum() throws {
    try #expect(renderHTML(Meter(value: 0.5, optimum: 0.2)) == #"<meter value="0.5" min="0.0" max="1.0" optimum="0.2"></meter>"#)
  }

  @Test func allAttributes() throws {
    try #expect(
      renderHTML(
        Meter(
          value: 0.75,
          min: 0,
          max: 1,
          low: 0.3,
          high: 0.9,
          optimum: 0.2
        )
      ) == #"<meter value="0.75" min="0.0" max="1.0" low="0.3" high="0.9" optimum="0.2"></meter>"#
    )
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Meter(value: 0.75) {
      DOMString("75%")
    }) == #"<meter value="0.75" min="0.0" max="1.0">75%</meter>"#)
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Meter(value: 0.5).language("en")) == #"<meter value="0.5" min="0.0" max="1.0" lang="en"></meter>"#)
  }
}
