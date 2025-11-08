import Foundation
import Testing

import Slipstream

struct MathMLTests {
  @Test func basicMath() throws {
    let html = try renderHTML(Math {
      MI("x")
    })

    #expect(html == """
<math>
 <mi>x</mi>
</math>
""")
  }

  @Test func mathWithDisplay() throws {
    let html = try renderHTML(Math {
      MI("x")
    }
    .display("block"))

    #expect(html == """
<math display="block">
 <mi>x</mi>
</math>
""")
  }

  @Test func simpleExpression() throws {
    let html = try renderHTML(Math {
      MRow {
        MI("x")
        MO("+")
        MI("y")
      }
    })

    #expect(html == """
<math>
 <mrow>
  <mi>x</mi>
  <mo>+</mo>
  <mi>y</mi>
 </mrow>
</math>
""")
  }

  @Test func fraction() throws {
    let html = try renderHTML(Math {
      MFrac {
        MI("a")
        MI("b")
      }
    })

    #expect(html == """
<math>
 <mfrac>
  <mi>a</mi>
  <mi>b</mi>
 </mfrac>
</math>
""")
  }

  @Test func fractionWithLinethickness() throws {
    let html = try renderHTML(Math {
      MFrac {
        MI("a")
        MI("b")
      }
      .linethickness("2px")
    })

    #expect(html == """
<math>
 <mfrac linethickness="2px">
  <mi>a</mi>
  <mi>b</mi>
 </mfrac>
</math>
""")
  }

  @Test func superscript() throws {
    let html = try renderHTML(Math {
      MSup {
        MI("x")
        MN("2")
      }
    })

    #expect(html == """
<math>
 <msup>
  <mi>x</mi>
  <mn>2</mn>
 </msup>
</math>
""")
  }

  @Test func msubElement() throws {
    let html = try renderHTML(Math {
      MSub {
        MI("x")
        MN("0")
      }
    })

    #expect(html == """
<math>
 <msub>
  <mi>x</mi>
  <mn>0</mn>
 </msub>
</math>
""")
  }

  @Test func subscriptAndSuperscript() throws {
    let html = try renderHTML(Math {
      MSubSup {
        MI("x")
        MN("0")
        MN("2")
      }
    })

    #expect(html == """
<math>
 <msubsup>
  <mi>x</mi>
  <mn>0</mn>
  <mn>2</mn>
 </msubsup>
</math>
""")
  }

  @Test func squareRoot() throws {
    let html = try renderHTML(Math {
      MSqrt {
        MI("x")
      }
    })

    #expect(html == """
<math>
 <msqrt>
  <mi>x</mi>
 </msqrt>
</math>
""")
  }

  @Test func nthRoot() throws {
    let html = try renderHTML(Math {
      MRoot {
        MI("x")
        MN("3")
      }
    })

    #expect(html == """
<math>
 <mroot>
  <mi>x</mi>
  <mn>3</mn>
 </mroot>
</math>
""")
  }

  @Test func underscript() throws {
    let html = try renderHTML(Math {
      MUnder {
        MO("lim")
        MRow {
          MI("x")
          MO("→")
          MN("0")
        }
      }
    })

    #expect(html == """
<math>
 <munder>
  <mo>lim</mo>
  <mrow>
   <mi>x</mi>
   <mo>→</mo>
   <mn>0</mn>
  </mrow>
 </munder>
</math>
""")
  }

  @Test func overscript() throws {
    let html = try renderHTML(Math {
      MOver {
        MI("x")
        MO("^")
      }
    })

    #expect(html == """
<math>
 <mover>
  <mi>x</mi>
  <mo>^</mo>
 </mover>
</math>
""")
  }

  @Test func underAndOverscript() throws {
    let html = try renderHTML(Math {
      MUnderOver {
        MO("∑")
        MRow {
          MI("i")
          MO("=")
          MN("1")
        }
        MI("n")
      }
    })

    #expect(html == """
<math>
 <munderover>
  <mo>∑</mo>
  <mrow>
   <mi>i</mi>
   <mo>=</mo>
   <mn>1</mn>
  </mrow>
  <mi>n</mi>
 </munderover>
</math>
""")
  }

  @Test func table() throws {
    let html = try renderHTML(Math {
      MTable {
        MTr {
          MTd {
            MN("1")
          }
          MTd {
            MN("2")
          }
        }
        MTr {
          MTd {
            MN("3")
          }
          MTd {
            MN("4")
          }
        }
      }
    })

    #expect(html == """
<math>
 <mtable>
  <mtr>
   <mtd>
    <mn>1</mn>
   </mtd>
   <mtd>
    <mn>2</mn>
   </mtd>
  </mtr>
  <mtr>
   <mtd>
    <mn>3</mn>
   </mtd>
   <mtd>
    <mn>4</mn>
   </mtd>
  </mtr>
 </mtable>
</math>
""")
  }

  @Test func textElement() throws {
    let html = try renderHTML(Math {
      MRow {
        MI("x")
        MO("=")
        MN("5")
        MText(" inches")
      }
    })

    #expect(html == """
<math>
 <mrow>
  <mi>x</mi>
  <mo>=</mo>
  <mn>5</mn>
  <mtext> inches</mtext>
 </mrow>
</math>
""")
  }

  @Test func stringLiteral() throws {
    let html = try renderHTML(Math {
      MS("Hello")
    })

    #expect(html == """
<math>
 <ms>Hello</ms>
</math>
""")
  }

  @Test func quadraticFormula() throws {
    let html = try renderHTML(Math {
      MRow {
        MI("x")
        MO("=")
        MFrac {
          MRow {
            MO("-")
            MI("b")
            MO("±")
            MSqrt {
              MRow {
                MSup {
                  MI("b")
                  MN("2")
                }
                MO("-")
                MN("4")
                MI("a")
                MI("c")
              }
            }
          }
          MRow {
            MN("2")
            MI("a")
          }
        }
      }
    })

    #expect(html == """
<math>
 <mrow>
  <mi>x</mi>
  <mo>=</mo>
  <mfrac>
   <mrow>
    <mo>-</mo>
    <mi>b</mi>
    <mo>±</mo>
    <msqrt>
     <mrow>
      <msup>
       <mi>b</mi>
       <mn>2</mn>
      </msup>
      <mo>-</mo>
      <mn>4</mn>
      <mi>a</mi>
      <mi>c</mi>
     </mrow>
    </msqrt>
   </mrow>
   <mrow>
    <mn>2</mn>
    <mi>a</mi>
   </mrow>
  </mfrac>
 </mrow>
</math>
""")
  }

  @Test func summation() throws {
    let html = try renderHTML(Math {
      MRow {
        MUnderOver {
          MO("∑")
          MRow {
            MI("i")
            MO("=")
            MN("1")
          }
          MI("n")
        }
        MSup {
          MI("i")
          MN("2")
        }
      }
    })

    #expect(html == """
<math>
 <mrow>
  <munderover>
   <mo>∑</mo>
   <mrow>
    <mi>i</mi>
    <mo>=</mo>
    <mn>1</mn>
   </mrow>
   <mi>n</mi>
  </munderover>
  <msup>
   <mi>i</mi>
   <mn>2</mn>
  </msup>
 </mrow>
</math>
""")
  }

  @Test func matrix() throws {
    let html = try renderHTML(Math {
      MTable {
        MTr {
          MTd {
            MI("a")
          }
          MTd {
            MI("b")
          }
        }
        MTr {
          MTd {
            MI("c")
          }
          MTd {
            MI("d")
          }
        }
      }
    })

    #expect(html == """
<math>
 <mtable>
  <mtr>
   <mtd>
    <mi>a</mi>
   </mtd>
   <mtd>
    <mi>b</mi>
   </mtd>
  </mtr>
  <mtr>
   <mtd>
    <mi>c</mi>
   </mtd>
   <mtd>
    <mi>d</mi>
   </mtd>
  </mtr>
 </mtable>
</math>
""")
  }

  @Test func nestedFractions() throws {
    let html = try renderHTML(Math {
      MFrac {
        MN("1")
        MRow {
          MI("x")
          MO("+")
          MFrac {
            MN("1")
            MI("y")
          }
        }
      }
    })

    #expect(html == """
<math>
 <mfrac>
  <mn>1</mn>
  <mrow>
   <mi>x</mi>
   <mo>+</mo>
   <mfrac>
    <mn>1</mn>
    <mi>y</mi>
   </mfrac>
  </mrow>
 </mfrac>
</math>
""")
  }

  @Test func mathWithClassModifier() throws {
    let html = try renderHTML(Math {
      MI("x")
    }
    .className("equation"))

    #expect(html == """
<math class="equation">
 <mi>x</mi>
</math>
""")
  }
}
