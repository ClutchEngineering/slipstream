# Slipstream for SwiftUI developers

An exhaustive comparison of Slipstream features to equivalent SwiftUI features.

Slipstream provides types that match SwiftUI types in both name and functionality whenever possible.

Because of this, Slipstream and SwiftUI aren't meant to be used together in the same source file.
For example, if you try to import both:

```swift
import Slipstream
import SwiftUI

struct HelloWorld: View {  // 'View' is ambiguous for type lookup in this context
  var body: some View {
    Text("Hello, world!")
  }
}
```

This is working as intended. The trade-off here is that Slipstream feels familiar if you already
know SwiftUI.

If you must use SwiftUI and Slipstream in the same `.swift` file, you can disambiguate types like
so:

```swift
import Slipstream
import SwiftUI

struct HelloWorld: SwiftUI.View {
  var body: some SwiftUI.View {
    SwiftUI.Text("Hello, world!")
  }
}
```

### How to read this guide

Code snippets with an `import SwiftUI` statement are SwiftUI examples, and snippets with an
`import Slipstream` statement are Slipstream examples. If no import is provided, then the snippet
works identically across both SwiftUI and Slipstream.

## Typography

SwiftUI's [Text](https://developer.apple.com/documentation/swiftui/text) is the building block for
most text in an application. In most cases, each Text instance will represent a distinct row of
text. This behavior is essentically identical with Slipstream's ``Text``, which corresponds to an
HTML `<p>` element.

```swift
struct ContentView: View {
  var body: some View {
    Text("Line 1")
    Text("Line 2")
  }
}
```

### Formatting text

#### Font design

SwiftUI and Slipstream both provide a ``View/fontDesign(_:condition:)-n2pt`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Monospaced")
      .fontDesign(.monospaced)
    Text("Serif")
      .fontDesign(.serif)
  }
}
```

#### Font weight

SwiftUI and Slipstream both provide a ``View/fontWeight(_:condition:)-5zmpr`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Bold")
      .fontWeight(.bold)
  }
}
```

They also both provide a ``View/bold(condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Bold")
      .bold()
  }
}
```

## Stacks

SwiftUI's [HStack](https://developer.apple.com/documentation/swiftui/hstack) and
[VStack](https://developer.apple.com/documentation/swiftui/vstack) define essential primitives for
creating structured layouts, and equivalent types are provided in Slipstream.

### HStack

```swift
var body: some View {
  HStack(
    alignment: .top,
    spacing: 10
  ) {
    Text("Column 1")
    Text("Column 2")
  }
}
```

### VStack

Note: Slipstream's default alignment for VStack is ``VStackAlignment/leading`` instead of
``AlignItems/center``, which is SwiftUI's VStack alignment default.

```swift
var body: some View {
  VStack(
    alignment: .leading,
    spacing: 10
  ) {
    Text("Line 1")
    Text("Line 2")
  }
}
```
