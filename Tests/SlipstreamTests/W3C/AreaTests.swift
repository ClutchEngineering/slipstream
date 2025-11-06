import Foundation
import Testing

import Slipstream

struct AreaTests {
  @Test func defaultShape() throws {
    try #expect(renderHTML(Area(alternativeText: "Default area")) == #"<area alt="Default area">"#)
  }

  @Test func rectangleShape() throws {
    try #expect(renderHTML(Area(
      shape: .rectangle,
      coordinates: "0,0,100,100",
      alternativeText: "Rectangle"
    )) == #"<area alt="Rectangle" coords="0,0,100,100" shape="rect">"#)
  }

  @Test func circleShape() throws {
    try #expect(renderHTML(Area(
      shape: .circle,
      coordinates: "50,50,25",
      alternativeText: "Circle"
    )) == #"<area alt="Circle" coords="50,50,25" shape="circle">"#)
  }

  @Test func polygonShape() throws {
    try #expect(renderHTML(Area(
      shape: .polygon,
      coordinates: "0,0,50,0,50,50,0,50",
      alternativeText: "Polygon"
    )) == #"<area alt="Polygon" coords="0,0,50,0,50,50,0,50" shape="poly">"#)
  }

  @Test func withDestination() throws {
    let url = URL(string: "https://example.com/section1")!
    try #expect(renderHTML(Area(
      shape: .rectangle,
      coordinates: "0,0,100,100",
      destination: url,
      alternativeText: "Section 1"
    )) == #"<area alt="Section 1" coords="0,0,100,100" href="https://example.com/section1" shape="rect">"#)
  }

  @Test func withTarget() throws {
    let url = URL(string: "https://example.com/section1")!
    try #expect(renderHTML(Area(
      shape: .rectangle,
      coordinates: "0,0,100,100",
      destination: url,
      alternativeText: "Section 1",
      target: "_blank"
    )) == #"<area alt="Section 1" coords="0,0,100,100" href="https://example.com/section1" shape="rect" target="_blank">"#)
  }

  @Test func withModifiers() throws {
    try #expect(renderHTML(Area(alternativeText: "Test")
      .id("area1")
      .className("clickable")) == #"<area alt="Test" class="clickable" id="area1">"#)
  }
}
