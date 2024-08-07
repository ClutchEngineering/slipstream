# Slipstream for SwiftUI developers

An exhaustive comparison of Slipstream features to equivalent SwiftUI features.

## The basics

SwiftUI's most primitive type is [View](https://developer.apple.com/documentation/swiftui/view).

Slipstream's most primitive type is also ``View``, but a Slipstream-specific definition of the type.

If you try to import both frameworks in a single swift file, you will get naming conflicts:

```swift
import Slipstream
import SwiftUI

struct HelloWorld: View {  // 'View' is ambiguous for type lookup in this context
  var body: some View {
    Text("Hello, world!")
  }
}
```

This is working as intended: you're not really meant to use SwiftUI and Slipstream in the same
code. The trade-off here is that it makes working with Slipstream feel much more natural if you're
already familiar with SwiftUI.

## Stacks

SwiftUI's [HStack](https://developer.apple.com/documentation/swiftui/hstack) and
[VStack](https://developer.apple.com/documentation/swiftui/vstack) define essential primitives for
creating structured layouts, and equivalent types are provided in Slipstream.

VStack in SwiftUI:

```
var body: some View {
  VStack(
    alignment: .leading,
    spacing: 10
  ) {
    ForEach(
      1...10,
      id: \.self
    ) {
      Text("Item \($0)")
    }
  }
}
```

VStack in Slipstream:

```
var body: some View {
  VStack(
    alignment: .leading,
    spacing: 10
  ) {
    for index in 1...10, {
      Text("Item \($0)")
    }
  }
}
```


