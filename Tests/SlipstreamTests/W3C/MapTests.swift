import Foundation
import Testing

import Slipstream

struct MapTests {
  @Test func emptyMap() throws {
    try #expect(renderHTML(Map("testmap") {}) == #"<map name="testmap"></map>"#)
  }

  @Test func withSingleArea() throws {
    try #expect(renderHTML(Map("worldmap") {
      Area(shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100), destination: URL(string: "/europe")!)
        .accessibilityLabel("Europe")
    }) == #"<map name="worldmap"><area shape="rect" coords="0,0,100,100" href="/europe" alt="Europe" /></map>"#)
  }

  @Test func withMultipleAreas() throws {
    try #expect(renderHTML(Map("worldmap") {
      Area(shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100), destination: URL(string: "/europe")!)
        .accessibilityLabel("Europe")
      Area(shape: .circle(x: 200, y: 200, radius: 50), destination: URL(string: "/asia")!)
        .accessibilityLabel("Asia")
    }) == #"<map name="worldmap"><area shape="rect" coords="0,0,100,100" href="/europe" alt="Europe" /><area shape="circle" coords="200,200,50" href="/asia" alt="Asia" /></map>"#)
  }

  @Test func withImageReference() throws {
    struct TestView: View {
      var body: some View {
        Div {
          Image(URL(string: "/worldmap.png")!)
            .modifier(AttributeModifier("usemap", value: "#worldmap"))
          Map("worldmap") {
            Area(shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100), destination: URL(string: "/europe")!)
              .accessibilityLabel("Europe")
          }
        }
      }
    }
    try #expect(renderHTML(TestView()) == ##"<div><img src="/worldmap.png" usemap="#worldmap" /><map name="worldmap"><area shape="rect" coords="0,0,100,100" href="/europe" alt="Europe" /></map></div>"##)
  }
}
