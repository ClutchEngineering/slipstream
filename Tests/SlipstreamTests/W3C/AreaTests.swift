import Foundation
import Testing

import Slipstream

struct AreaTests {
  @Test func defaultShape() throws {
    try #expect(renderHTML(Area(alternativeText: "Default area")) == #"<area alt="Default area" />"#)
  }

  @Test func rectangleShape() throws {
    try #expect(renderHTML(Area(
      shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100),
      alternativeText: "Rectangle"
    )) == #"<area alt="Rectangle" shape="rect" coords="0,0,100,100" />"#)
  }

  @Test func circleShape() throws {
    try #expect(renderHTML(Area(
      shape: .circle(x: 50, y: 50, radius: 25),
      alternativeText: "Circle"
    )) == #"<area alt="Circle" shape="circle" coords="50,50,25" />"#)
  }

  @Test func polygonShape() throws {
    try #expect(renderHTML(Area(
      shape: .polygon(coordinates: [(x: 0, y: 0), (x: 50, y: 0), (x: 50, y: 50), (x: 0, y: 50)]),
      alternativeText: "Polygon"
    )) == #"<area alt="Polygon" shape="poly" coords="0,0,50,0,50,50,0,50" />"#)
  }

  @Test func withDestination() throws {
    let url = URL(string: "https://example.com/section1")!
    try #expect(renderHTML(Area(
      shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100),
      destination: url,
      alternativeText: "Section 1"
    )) == #"<area alt="Section 1" shape="rect" coords="0,0,100,100" href="https://example.com/section1" />"#)
  }

  @Test func withTarget() throws {
    let url = URL(string: "https://example.com/section1")!
    try #expect(renderHTML(Area(
      shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100),
      destination: url,
      alternativeText: "Section 1",
      target: "_blank"
    )) == #"<area alt="Section 1" shape="rect" coords="0,0,100,100" href="https://example.com/section1" target="_blank" />"#)
  }

  @Test func withModifiers() throws {
    try #expect(renderHTML(Area(alternativeText: "Test")
      .id("area1")
      .className("clickable")) == #"<area alt="Test" id="area1" class="clickable" />"#)
  }
}
