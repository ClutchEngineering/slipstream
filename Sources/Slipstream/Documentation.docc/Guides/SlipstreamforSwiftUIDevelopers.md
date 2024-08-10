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

## Animations

SwiftUI and Slipstream both support implicit animations using the ``View/animation(_:condition:)``
modifier.

### Timing functions

```swift
var body: some View {
  Text("Linear")
    .animation(.linear)
  Text("Ease in")
    .animation(.easeIn)
  Text("Ease out")
    .animation(.easeOut)
  Text("Ease in/out")
    .animation(.easeInOut)
}
```

### Timing functions with durations

```swift
var body: some View {
  Text("Linear")
    .animation(.linear(duration: 0.25))
  Text("Ease in")
    .animation(.easeIn(duration: 0.25))
  Text("Ease out")
    .animation(.easeOut(duration: 0.25))
  Text("Ease in/out")
    .animation(.easeInOut(duration: 0.25))
}
```

## @Environment

Slipstream's ``Environment`` APIs are a near 1-1 match with SwiftUI's equivalent APIs. Slipstream
does not provide any environment keys out of the box, but the ability to read and write environment
state enables entire categories of functionality to be built on top of Slipstream including:

- Views that are recursively configurable via "stylesheet" objects injected into the environment.
- Awareness of the current page URL, e.g. marking a navigation link as "active" based on the current
  page being rendered.

### Injecting environment state

```swift
MyView()
  .environment(\.path, "/home")
```

### Reading environment state

```swift
struct MyView: View {
  @Environment(\.path) var path

  var body: some View {
    Text(path)
  }
}
```

## Layout

SwiftUI and Slipstream both provide the ability to affect the layout of views.

Note that Slipstream will find the next closest Tailwind CSS layout class for the given point size
rather than using the exact units. This is an intentional deviation from SwiftUI's behavior in order
to align with Tailwind CSS' use of pre-defined sizes.

### Offset

```swift
var body: some View {
  Text("Offset x")
    .offset(x: 16)
  Text("Offset y")
    .offset(y: 32)
  Text("Offset both")
    .offset(x, 4, y: 8)
}
```

## Materials

SwiftUI and Slipstream both provide the ability to apply material backgrounds to views.

### Offset

```swift
var body: some View {
  Text("Blurred background")
    .background(.ultraThin)
}
```

## Sizing

SwiftUI and Slipstream both provide a
``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
modifier to adjust the width and height of a view.

Note that Slipstream will find the next closest Tailwind CSS sizing class for the given point size
rather than using the exact units. This is an intentional deviation from SwiftUI's behavior in order
to align with Tailwind CSS' use of pre-defined sizes.

### Width and height

```swift
var body: some View {
  Text("Line")
    .frame(width: 48, height: 48)
}
```

### Min/max width and height

```swift
var body: some View {
  Text("Min width")
    .frame(minWidth: 48)
  Text("Min height")
    .frame(minHeight: 48)
  Text("Bounded dimensions")
    .frame(minWidth: 48, maxWidth: 96)
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
