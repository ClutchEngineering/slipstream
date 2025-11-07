import Foundation
import Testing

import Slipstream

struct SVGTests {
  @Test func svgWithPath() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 24 24") {
      SVGPath("M12 0c-6.626 0-12 5.373-12 12 0 6.627 5.374 12 12 12s12-5.373 12-12-5.374-12-12-12z")
    })

    #expect(html == """
<svg viewBox="0 0 24 24">
 <path d="M12 0c-6.626 0-12 5.373-12 12 0 6.627 5.374 12 12 12s12-5.373 12-12-5.374-12-12-12z"></path>
</svg>
""")
  }

  @Test func svgWithMultiplePaths() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 24 24") {
      SVGPath("M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10")
      SVGPath("M22 12c0 5.52-4.48 10-10 10")
    })

    #expect(html == """
<svg viewBox="0 0 24 24">
 <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10"></path>
 <path d="M22 12c0 5.52-4.48 10-10 10"></path>
</svg>
""")
  }

  @Test func svgWithMixedContent() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 24 24") {
      SVGPath("M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10")
      RawHTML("<circle cx=\"12\" cy=\"12\" r=\"3\"/>")
    })

    #expect(html == """
<svg viewBox="0 0 24 24">
 <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10"></path><circle cx="12" cy="12" r="3"/>
</svg>
""")
  }

  @Test func svgWithClassModifier() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 24 24") {
      SVGPath("M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10")
    }
    .className("w-6 h-6"))

    #expect(html == """
<svg viewBox="0 0 24 24" class="h-6 w-6">
 <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10"></path>
</svg>
""")
  }

  @Test func pathStandalone() throws {
    let html = try renderHTML(SVGPath("M12 0L24 12L12 24L0 12Z"))

    #expect(html == """
<path d="M12 0L24 12L12 24L0 12Z"></path>
""")
  }

  @Test func pathWithTransform() throws {
    let html = try renderHTML(SVGPath("M12 0L24 12L12 24L0 12Z")
      .transform(.translate(x: 10, y: 20)))

    #expect(html == """
<path d="M12 0L24 12L12 24L0 12Z" transform="translate(10.0,20.0)"></path>
""")
  }

  @Test func svgDefs() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGDefs {
        SVGLinearGradient {
          SVGStop(offset: 0, color: .red)
          SVGStop(offset: 1, color: .blue)
        }
        .id("grad1")
      }
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <defs>
  <linearGradient x1="0%" y1="0%" x2="100%" y2="0%" gradientUnits="objectBoundingBox" id="grad1">
   <stop offset="0" stop-color="#ff0000"></stop>
   <stop offset="1" stop-color="#0000ff"></stop>
  </linearGradient>
 </defs>
</svg>
""")
  }

  @Test func linearGradient() throws {
    let html = try renderHTML(SVGLinearGradient(start: Point(x: 0, y: 0), end: Point(x: 0, y: 1)) {
      SVGStop(offset: 0, color: .red)
      SVGStop(offset: 1, color: .blue)
    }
    .id("grad1"))

    #expect(html == """
<linearGradient x1="0%" y1="0%" x2="0%" y2="100%" gradientUnits="objectBoundingBox" id="grad1">
 <stop offset="0" stop-color="#ff0000"></stop>
 <stop offset="1" stop-color="#0000ff"></stop>
</linearGradient>
""")
  }

  @Test func radialGradient() throws {
    let html = try renderHTML(SVGRadialGradient(center: Point(x: 0.5, y: 0.5), radius: 0.5) {
      SVGStop(offset: 0, color: .white)
      SVGStop(offset: 1, color: .black)
    }
    .id("radial1"))

    #expect(html == """
<radialGradient cx="50%" cy="50%" r="50%" gradientUnits="objectBoundingBox" id="radial1">
 <stop offset="0" stop-color="#ffffff"></stop>
 <stop offset="1" stop-color="#000000"></stop>
</radialGradient>
""")
  }

  @Test func radialGradientWithFocalPoint() throws {
    let html = try renderHTML(SVGRadialGradient(center: Point(x: 0.5, y: 0.5), radius: 0.5, focalPoint: Point(x: 0.3, y: 0.3)) {
      SVGStop(offset: 0, color: .white)
      SVGStop(offset: 1, color: .black)
    }
    .id("radial2"))

    #expect(html == """
<radialGradient cx="50%" cy="50%" r="50%" fx="30%" fy="30%" gradientUnits="objectBoundingBox" id="radial2">
 <stop offset="0" stop-color="#ffffff"></stop>
 <stop offset="1" stop-color="#000000"></stop>
</radialGradient>
""")
  }

  @Test func svgGroup() throws {
    let html = try renderHTML(SVGGroup {
      SVGPath("M10,10 L50,50")
      SVGPath("M50,50 L90,10")
    })

    #expect(html == """
<g>
 <path d="M10,10 L50,50"></path>
 <path d="M50,50 L90,10"></path>
</g>
""")
  }

  @Test func svgGroupWithTransform() throws {
    let html = try renderHTML(SVGGroup {
      SVGPath("M10,10 L50,50")
      SVGPath("M50,50 L90,10")
    }
    .transform(.rotate(angle: 45, centerX: 50, centerY: 50)))

    #expect(html == """
<g transform="rotate(45.0,50.0,50.0)">
 <path d="M10,10 L50,50"></path>
 <path d="M50,50 L90,10"></path>
</g>
""")
  }

  @Test func complexSVGWithGradients() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGDefs {
        SVGLinearGradient {
          SVGStop(offset: 0, color: .red)
          SVGStop(offset: 1, color: .blue)
        }
        .id("gradient1")
      }
      SVGPath("M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,45 Q10,90 10,90 Z")
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <defs>
  <linearGradient x1="0%" y1="0%" x2="100%" y2="0%" gradientUnits="objectBoundingBox" id="gradient1">
   <stop offset="0" stop-color="#ff0000"></stop>
   <stop offset="1" stop-color="#0000ff"></stop>
  </linearGradient>
 </defs>
 <path d="M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,45 Q10,90 10,90 Z"></path>
</svg>
""")
  }

  @Test func svgTitle() throws {
    let html = try renderHTML(SVGTitle("A red circle"))

    #expect(html == """
<title>A red circle</title>
""")
  }

  @Test func svgDesc() throws {
    let html = try renderHTML(SVGDesc("This graphic shows a red circle centered in a 100x100 viewport"))

    #expect(html == """
<desc>
 This graphic shows a red circle centered in a 100x100 viewport
</desc>
""")
  }

  @Test func svgWithTitleAndDesc() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGTitle("Red Circle")
      SVGDesc("A simple red circle for demonstration purposes")
      SVGPath("M50,10 A40,40 0 1,1 50,90 A40,40 0 1,1 50,10")
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <title>Red Circle</title>
 <desc>
  A simple red circle for demonstration purposes
 </desc>
 <path d="M50,10 A40,40 0 1,1 50,90 A40,40 0 1,1 50,10"></path>
</svg>
""")
  }

  @Test func svgTitleWithViewBuilderContent() throws {
    let html = try renderHTML(SVGTitle {
      DOMString("Interactive ")
      DOMString("Button")
    })

    #expect(html == """
<title>Interactive Button</title>
""")
  }

  @Test func svgDescWithViewBuilderContent() throws {
    let html = try renderHTML(SVGDesc {
      DOMString("This button can be clicked to ")
      DOMString("perform an action")
    })

    #expect(html == """
<desc>
 This button can be clicked to perform an action
</desc>
""")
  }

  @Test func svgCircle() throws {
    let html = try renderHTML(SVGCircle(origin: Point(x: 50, y: 50), radius: 40))

    #expect(html == """
<circle cx="50" cy="50" r="40"></circle>
""")
  }

  @Test func svgCircleInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGCircle(origin: Point(x: 50, y: 50), radius: 40)
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <circle cx="50" cy="50" r="40"></circle>
</svg>
""")
  }

  @Test func svgRect() throws {
    let html = try renderHTML(SVGRect(origin: Point(x: 10, y: 20), size: Size(width: 80, height: 60)))

    #expect(html == """
<rect x="10" y="20" width="80" height="60"></rect>
""")
  }

  @Test func svgRectWithRoundedCorners() throws {
    let html = try renderHTML(SVGRect(origin: Point(x: 10, y: 20), size: Size(width: 80, height: 60), radiusX: 5, radiusY: 5))

    #expect(html == """
<rect x="10" y="20" width="80" height="60" rx="5" ry="5"></rect>
""")
  }

  @Test func svgRectInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGRect(size: Size(width: 50, height: 50))
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <rect x="0" y="0" width="50" height="50"></rect>
</svg>
""")
  }

  @Test func svgText() throws {
    let html = try renderHTML(SVGText("Hello World", at: Point(x: 50, y: 25)))

    #expect(html == """
<text x="50" y="25">
 Hello World
</text>
""")
  }

  @Test func svgTextWithStyling() throws {
    let html = try renderHTML(SVGText("Styled Text", at: Point(x: 50, y: 25))
      .fontSize("16")
      .fontFamily("Arial")
      .fontWeight("bold")
      .textAnchor("middle")
      .fill(.hex("#333")))

    #expect(html == """
<text x="50" y="25" font-size="16" font-family="Arial" font-weight="bold" text-anchor="middle" fill="#333">
 Styled Text
</text>
""")
  }

  @Test func svgTextWithStroke() throws {
    let html = try renderHTML(SVGText("Outlined", at: Point(x: 50, y: 25))
      .stroke(.black)
      .strokeWidth("2")
      .fill(.white))

    #expect(html == """
<text x="50" y="25" fill="#ffffff" stroke="#000000" stroke-width="2">
 Outlined
</text>
""")
  }

  @Test func svgTextInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 50") {
      SVGText("Hello SVG", at: Point(x: 50, y: 25))
        .fontSize("16")
        .textAnchor("middle")
    })

    #expect(html == """
<svg viewBox="0 0 100 50">
 <text x="50" y="25" font-size="16" text-anchor="middle">
  Hello SVG
 </text>
</svg>
""")
  }

  // MARK: - SVGColor Tests

  @Test func svgColorHex() throws {
    let html = try renderHTML(SVGStop(offset: 0, color: .hex("#ff6b6b")))
    
    #expect(html.contains("stop-color=\"#ff6b6b\""))
  }

  @Test func svgColorRGB() throws {
    let html = try renderHTML(SVGStop(offset: 0, color: .rgb(255, 107, 107)))
    
    #expect(html.contains("stop-color=\"rgb(255,107,107)\""))
  }

  @Test func svgColorRGBA() throws {
    let html = try renderHTML(SVGStop(offset: 0.5, color: .rgba(255, 0, 0, 0.5)))
    
    #expect(html.contains("stop-color=\"rgba(255,0,0,0.5)\""))
    // Note: RGBA already contains alpha, so stop-opacity is not added unless explicitly set
    #expect(!html.contains("stop-opacity"))
  }

  @Test func svgColorNamed() throws {
    let html = try renderHTML(SVGStop(offset: 0, color: .named("coral")))
    
    #expect(html.contains("stop-color=\"coral\""))
  }

  @Test func svgColorStaticConveniences() throws {
    let html = try renderHTML(SVGLinearGradient {
      SVGStop(offset: 0, color: .black)
      SVGStop(offset: 0.5, color: .transparent)
      SVGStop(offset: 1, color: .currentColor)
    }.id("test"))
    
    #expect(html.contains("stop-color=\"#000000\""))
    #expect(html.contains("stop-color=\"transparent\""))
    #expect(html.contains("stop-color=\"currentColor\""))
  }

  // MARK: - SVGStop Opacity Tests

  @Test func svgStopWithOpacity() throws {
    let html = try renderHTML(SVGStop(offset: 0.5, color: .red, opacity: 0.8))
    
    #expect(html.contains("offset=\"0.5\""))
    #expect(html.contains("stop-color=\"#ff0000\""))
    #expect(html.contains("stop-opacity=\"0.8\""))
  }

  @Test func svgStopFullOpacity() throws {
    // Should NOT render stop-opacity when opacity = 1.0
    let html = try renderHTML(SVGStop(offset: 0, color: .blue, opacity: 1.0))
    
    #expect(html.contains("stop-color=\"#0000ff\""))
    #expect(!html.contains("stop-opacity"))
  }

  @Test func svgStopZeroOpacity() throws {
    let html = try renderHTML(SVGStop(offset: 1, color: .green, opacity: 0.0))
    
    #expect(html.contains("stop-opacity=\"0\""))
  }

  // MARK: - Point.zero and Default Position Tests

  @Test func svgTextWithDefaultPosition() throws {
    let html = try renderHTML(SVGText("Default"))
    
    #expect(html == """
<text x="0" y="0">
 Default
</text>
""")
  }

  @Test func svgRectWithDefaultOrigin() throws {
    let html = try renderHTML(SVGRect(size: Size(width: 50, height: 50)))
    
    #expect(html == """
<rect x="0" y="0" width="50" height="50"></rect>
""")
  }

  @Test func svgLinearGradientWithDefaultPoints() throws {
    let html = try renderHTML(SVGLinearGradient {
      SVGStop(offset: 0, color: .red)
    }.id("grad"))
    
    #expect(html.contains("x1=\"0%\""))
    #expect(html.contains("y1=\"0%\""))
    #expect(html.contains("x2=\"100%\""))
    #expect(html.contains("y2=\"0%\""))
  }

  @Test func svgRadialGradientWithDefaultCenter() throws {
    let html = try renderHTML(SVGRadialGradient {
      SVGStop(offset: 0, color: .white)
    }.id("radial"))
    
    #expect(html.contains("cx=\"50%\""))
    #expect(html.contains("cy=\"50%\""))
    #expect(html.contains("r=\"50%\""))
  }
}
