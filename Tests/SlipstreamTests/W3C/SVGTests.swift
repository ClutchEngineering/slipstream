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
      .transform("translate(10,20) scale(1.5)"))

    #expect(html == """
<path d="M12 0L24 12L12 24L0 12Z" transform="translate(10,20) scale(1.5)"></path>
""")
  }

  @Test func svgDefs() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGDefs {
        SVGLinearGradient(id: "grad1") {
          SVGStop(offset: "0%", stopColor: "#ff0000")
          SVGStop(offset: "100%", stopColor: "#0000ff")
        }
      }
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <defs>
  <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%" gradientUnits="objectBoundingBox">
   <stop offset="0%" stop-color="#ff0000"></stop>
   <stop offset="100%" stop-color="#0000ff"></stop>
  </linearGradient>
 </defs>
</svg>
""")
  }

  @Test func linearGradient() throws {
    let html = try renderHTML(SVGLinearGradient(id: "grad1", x1: "0%", y1: "0%", x2: "0%", y2: "100%") {
      SVGStop(offset: "0%", stopColor: "#ff0000", stopOpacity: "1")
      SVGStop(offset: "100%", stopColor: "#0000ff")
    })

    #expect(html == """
<linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%" gradientUnits="objectBoundingBox">
 <stop offset="0%" stop-color="#ff0000" stop-opacity="1"></stop>
 <stop offset="100%" stop-color="#0000ff"></stop>
</linearGradient>
""")
  }

  @Test func radialGradient() throws {
    let html = try renderHTML(SVGRadialGradient(id: "radial1", cx: "50%", cy: "50%", r: "50%") {
      SVGStop(offset: "0%", stopColor: "#ffffff")
      SVGStop(offset: "100%", stopColor: "#000000")
    })

    #expect(html == """
<radialGradient id="radial1" cx="50%" cy="50%" r="50%" gradientUnits="objectBoundingBox">
 <stop offset="0%" stop-color="#ffffff"></stop>
 <stop offset="100%" stop-color="#000000"></stop>
</radialGradient>
""")
  }

  @Test func radialGradientWithFocalPoint() throws {
    let html = try renderHTML(SVGRadialGradient(id: "radial2", cx: "50%", cy: "50%", r: "50%", fx: "30%", fy: "30%") {
      SVGStop(offset: "0%", stopColor: "#ffffff")
      SVGStop(offset: "100%", stopColor: "#000000")
    })

    #expect(html == """
<radialGradient id="radial2" cx="50%" cy="50%" r="50%" fx="30%" fy="30%" gradientUnits="objectBoundingBox">
 <stop offset="0%" stop-color="#ffffff"></stop>
 <stop offset="100%" stop-color="#000000"></stop>
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
    .transform("translate(10,20) scale(1.5)"))

    #expect(html == """
<g transform="translate(10,20) scale(1.5)">
 <path d="M10,10 L50,50"></path>
 <path d="M50,50 L90,10"></path>
</g>
""")
  }

  @Test func complexSVGWithGradients() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGDefs {
        SVGLinearGradient(id: "gradient1") {
          SVGStop(offset: "0%", stopColor: "#ff0000")
          SVGStop(offset: "100%", stopColor: "#0000ff")
        }
      }
      SVGPath("M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,45 Q10,90 10,90 Z")
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <defs>
  <linearGradient id="gradient1" x1="0%" y1="0%" x2="100%" y2="0%" gradientUnits="objectBoundingBox">
   <stop offset="0%" stop-color="#ff0000"></stop>
   <stop offset="100%" stop-color="#0000ff"></stop>
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
    let html = try renderHTML(SVGCircle(cx: "50", cy: "50", r: "40"))

    #expect(html == """
<circle cx="50" cy="50" r="40"></circle>
""")
  }

  @Test func svgCircleInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGCircle(cx: "50", cy: "50", r: "40")
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <circle cx="50" cy="50" r="40"></circle>
</svg>
""")
  }

  @Test func svgRect() throws {
    let html = try renderHTML(SVGRect(x: "10", y: "20", width: "80", height: "60"))

    #expect(html == """
<rect x="10" y="20" width="80" height="60"></rect>
""")
  }

  @Test func svgRectWithRoundedCorners() throws {
    let html = try renderHTML(SVGRect(x: "10", y: "20", width: "80", height: "60", rx: "5", ry: "5"))

    #expect(html == """
<rect x="10" y="20" width="80" height="60" rx="5" ry="5"></rect>
""")
  }

  @Test func svgRectInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 100") {
      SVGRect(width: "50", height: "50")
    })

    #expect(html == """
<svg viewBox="0 0 100 100">
 <rect x="0" y="0" width="50" height="50"></rect>
</svg>
""")
  }

  @Test func svgText() throws {
    let html = try renderHTML(SVGText("Hello World", x: "50", y: "25"))

    #expect(html == """
<text x="50" y="25">
 Hello World
</text>
""")
  }

  @Test func svgTextWithStyling() throws {
    let html = try renderHTML(SVGText("Styled Text", x: "50", y: "25")
      .fontSize("16")
      .fontFamily("Arial")
      .fontWeight("bold")
      .textAnchor("middle")
      .fill("#333"))

    #expect(html == """
<text x="50" y="25" font-size="16" font-family="Arial" font-weight="bold" text-anchor="middle" fill="#333">
 Styled Text
</text>
""")
  }

  @Test func svgTextWithStroke() throws {
    let html = try renderHTML(SVGText("Outlined", x: "50", y: "25")
      .stroke("#000000")
      .strokeWidth("2")
      .fill("#ffffff"))

    #expect(html == """
<text x="50" y="25" fill="#ffffff" stroke="#000000" stroke-width="2">
 Outlined
</text>
""")
  }

  @Test func svgTextInSVG() throws {
    let html = try renderHTML(SVG(viewBox: "0 0 100 50") {
      SVGText("Hello SVG", x: "50", y: "25")
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
}
