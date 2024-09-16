import Foundation
import Testing

import Slipstream

final class InlineHTMLTests {

  @Test func stringConcatenation() async throws {
    #expect("""
This is some text.

\(inlineHTML {
  Text("Foo")
})
""" == """
This is some text.

<p>Foo</p>
""")
  }
}
