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

## Filters

SwiftUI and Slipstream both provide the ability to invert colors.

### Offset

```swift
var body: some View {
  Text("Inverted text")
    .colorInvert()
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

#### Font style

SwiftUI and Slipstream both provide a ``View/fontStyle(_:condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Italic")
      .fontStyle(.italic)
  }
}
```

They also both provide an ``View/italic(condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Italic")
      .italic()
  }
}
```

#### Font size

SwiftUI and Slipstream both provide a ``View/fontSize(_:condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Large text")
      .fontSize(.extraLarge)
  }
}
```

#### Line height

SwiftUI and Slipstream both provide modifiers to control line height. In Slipstream, use ``View/fontLeading(_:condition:)``:

```swift
struct ContentView: View {
  var body: some View {
    Text("Loose line spacing")
      .fontLeading(.loose)
  }
}
```

#### Text alignment

SwiftUI and Slipstream both provide a ``View/textAlignment(_:condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Centered text")
      .textAlignment(.center)
  }
}
```

#### Text color

SwiftUI and Slipstream both provide a ``View/textColor(_:condition:)`` modifier:

```swift
struct ContentView: View {
  var body: some View {
    Text("Colored text")
      .textColor(.red)
  }
}
```

#### Text decoration

Slipstream provides a ``View/textDecoration(_:condition:)`` modifier for underlining, strikethrough, and other text decorations:

```swift
import Slipstream

struct ContentView: View {
  var body: some View {
    Text("Underlined")
      .textDecoration(.underline)
    Text("Strikethrough")
      .textDecoration(.lineThrough)
  }
}
```

### Text-level semantic elements

HTML provides many semantic elements for marking up inline text with specific meaning. Slipstream provides types for all of these elements.

#### Bold and Strong

While ``Bold`` and ``Strong`` both render as bold text, Strong carries semantic emphasis:

```swift
import Slipstream

struct ContentView: View {
  var body: some View {
    Paragraph {
      Text("This is ")
      Bold("visually bold")
      Text(" and this is ")
      Strong("semantically strong")
    }
  }
}
```

#### Italic and Emphasis

Similarly, ``Italic`` and ``Emphasis`` both render as italic, but Emphasis carries semantic meaning:

```swift
import Slipstream

struct ContentView: View {
  var body: some View {
    Paragraph {
      Text("This is ")
      Italic("visually italic")
      Text(" and this is ")
      Emphasis("semantically emphasized")
    }
  }
}
```

#### Code and related elements

For marking up code and technical content:

```swift
import Slipstream

struct ContentView: View {
  var body: some View {
    Paragraph {
      Text("Use the ")
      Code("print()")
      Text(" function")
    }
    Paragraph {
      Text("Variable: ")
      Variable("x")
    }
    Paragraph {
      Text("Output: ")
      SampleOutput("Hello, World!")
    }
  }
}
```

#### Other text-level elements

```swift
import Slipstream

struct ContentView: View {
  var body: some View {
    Paragraph {
      Mark("Highlighted text")
    }
    Paragraph {
      Small("Fine print")
    }
    Paragraph {
      Text("E = mc")
      Superscript("2")
    }
    Paragraph {
      Text("H")
      Subscript("2")
      Text("O")
    }
    Paragraph {
      Abbreviation("HTML", title: "HyperText Markup Language")
    }
    Paragraph {
      Quote("Inline quotation")
    }
    Paragraph {
      Text("See ")
      Citation("The Swift Programming Language")
    }
    Paragraph {
      Underline("Underlined text")
    }
    Paragraph {
      Strikethrough("Deleted text")
    }
  }
}
```

## Spacing

SwiftUI and Slipstream both provide modifiers to add spacing around views.

### Padding

```swift
var body: some View {
  Text("Padded content")
    .padding()  // All edges
  Text("Horizontal padding")
    .padding(.horizontal, 16)
  Text("Vertical padding")
    .padding(.vertical, 8)
}
```

### Margin

Slipstream provides a ``View/margin(_:_:condition:)`` modifier for external spacing:

```swift
import Slipstream

var body: some View {
  Text("Margin around content")
    .margin(8)
  Text("Top margin only")
    .margin(.top, 16)
}
```

## Colors

SwiftUI and Slipstream both provide color systems for styling views.

### Named colors

```swift
var body: some View {
  Text("Red text")
    .textColor(.red)
  Text("Blue background")
    .background(.blue)
}
```

### Color shades

Slipstream uses Tailwind CSS's color palette with numeric shades from 50 (lightest) to 950 (darkest):

```swift
import Slipstream

var body: some View {
  Text("Light blue")
    .textColor(.blue, shade: .x50)
  Text("Dark blue")
    .textColor(.blue, shade: .x950)
}
```

## Borders and Effects

### Border

SwiftUI and Slipstream both provide border modifiers:

```swift
var body: some View {
  Text("Bordered content")
    .border(1, .black)
}
```

### Corner radius

```swift
var body: some View {
  Text("Rounded corners")
    .padding()
    .background(.blue)
    .cornerRadius(.large)
}
```

### Shadow

SwiftUI and Slipstream both support shadow effects:

```swift
var body: some View {
  Text("Drop shadow")
    .shadow(.large)
}
```

### Outline

Slipstream provides an ``View/outline(_:width:color:condition:)`` modifier:

```swift
import Slipstream

var body: some View {
  Text("Outlined text")
    .outline(.solid, width: 2, color: .red)
}
```

### Ring

Slipstream provides a ``View/ring(width:color:offset:condition:)`` modifier for focus rings and borders:

```swift
import Slipstream

var body: some View {
  Text("Ring effect")
    .ring(width: 2, color: .blue)
}
```

## Positioning and Display

### Position

Slipstream provides a ``View/position(_:edges:_:condition:)`` modifier for CSS positioning:

```swift
import Slipstream

var body: some View {
  Text("Absolutely positioned")
    .position(.absolute, edges: .top, 0)
    .position(.absolute, edges: .left, 0)
}
```

### Placement

The ``View/placement(top:right:bottom:left:zIndex:condition:)`` modifier provides fine-grained control:

```swift
import Slipstream

var body: some View {
  Text("Custom placement")
    .placement(top: 10, left: 10, zIndex: 10)
}
```

### Z-index

```swift
var body: some View {
  Text("Layered content")
    .zIndex(100)
}
```

### Display

Control the CSS display property:

```swift
import Slipstream

var body: some View {
  Text("Block display")
    .display(.block)
  Text("Flex display")
    .display(.flex)
  Text("Hidden")
    .display(.none)
}
```

### Overflow

```swift
import Slipstream

var body: some View {
  Text("Scrollable content")
    .overflow(.scroll)
}
```

### Float

```swift
import Slipstream

var body: some View {
  Text("Floated content")
    .float(.left)
}
```

### Visibility

Slipstream provides a ``View/visibility(_:condition:)`` modifier:

```swift
import Slipstream

var body: some View {
  Text("Hidden but occupies space")
    .visibility(.hidden)
}
```

## Flexbox and Grid Layout

### Flex direction

```swift
import Slipstream

var body: some View {
  VStack {
    Text("Item 1")
    Text("Item 2")
  }
  .flexDirection(.row)  // Override VStack to horizontal
}
```

### Justify content

```swift
var body: some View {
  HStack {
    Text("Start")
    Text("End")
  }
  .justifyContent(.spaceBetween)
}
```

### Align items

```swift
var body: some View {
  HStack {
    Text("Top")
    Text("Bottom")
  }
  .alignItems(.center)
}
```

### Flex gap

```swift
import Slipstream

var body: some View {
  HStack {
    Text("Item 1")
    Text("Item 2")
  }
  .flexGap(16)
}
```

### Grid cells

Slipstream provides modifiers for grid layouts:

```swift
import Slipstream

var body: some View {
  Text("Spans 2 columns")
    .gridCellColumns(2)
  Text("Spans 3 rows")
    .gridCellRows(3)
}
```

## Responsive Design

Slipstream supports Tailwind CSS breakpoints for responsive layouts.

### Breakpoint modifiers

Most modifiers accept a `condition` parameter for responsive behavior:

```swift
import Slipstream

var body: some View {
  Text("Responsive sizing")
    .fontSize(.base)
    .fontSize(.large, condition: .desktop)
  Text("Responsive padding")
    .padding(4)
    .padding(8, condition: .tablet)
    .padding(16, condition: .desktop)
}
```

### Responsive stacks

Use ``ResponsiveStack`` to create layouts that adapt to screen size:

```swift
import Slipstream

var body: some View {
  ResponsiveStack(
    mobileBreakpoint: .mobile,
    tabletBreakpoint: .tablet
  ) {
    Text("Column 1")
    Text("Column 2")
  }
}
```

### State-based styling

Apply styles based on hover, focus, and other states:

```swift
import Slipstream

var body: some View {
  Link("Hover me", destination: "/")
    .textColor(.blue)
    .textColor(.red, condition: .hover)
}
```

## Lists

### Unordered and ordered lists

```swift
import Slipstream

var body: some View {
  List {
    ListItem { Text("Item 1") }
    ListItem { Text("Item 2") }
    ListItem { Text("Item 3") }
  }
}
```

### List styles

```swift
import Slipstream

var body: some View {
  List {
    ListItem { Text("Disc marker") }
  }
  .listStyle(.disc)

  List {
    ListItem { Text("Numbered") }
  }
  .listStyle(.decimal)
}
```

### Description lists

```swift
import Slipstream

var body: some View {
  DescriptionList {
    DescriptionTerm { Text("Term") }
    DefinitionDescription { Text("Definition") }
  }
}
```

## Structural Elements

HTML provides semantic elements for structuring documents. Slipstream provides types for all of these.

### Header, Footer, and Navigation

```swift
import Slipstream

var body: some View {
  Header {
    Navigation {
      Link("Home", destination: "/")
      Link("About", destination: "/about")
    }
  }
  DocumentMain {
    Text("Main content")
  }
  Footer {
    Text("© 2025")
  }
}
```

### Article and Section

```swift
import Slipstream

var body: some View {
  Article {
    Section {
      H1("Article Title")
      Text("Article content...")
    }
  }
}
```

### Aside

```swift
import Slipstream

var body: some View {
  Aside {
    Text("Sidebar content")
  }
}
```

### Headings

```swift
import Slipstream

var body: some View {
  H1("Heading 1")
  H2("Heading 2")
  H3("Heading 3")
  H4("Heading 4")
  H5("Heading 5")
  H6("Heading 6")
}
```

### Heading groups

```swift
import Slipstream

var body: some View {
  HGroup {
    H1("Main Title")
    H2("Subtitle")
  }
}
```

## Grouping Content

### Paragraphs and Text

While ``Text`` renders as a `<p>` tag, ``Paragraph`` provides explicit paragraph semantics:

```swift
import Slipstream

var body: some View {
  Paragraph {
    Text("First paragraph")
  }
  Paragraph {
    Text("Second paragraph")
  }
}
```

### Blockquotes

```swift
import Slipstream

var body: some View {
  Blockquote {
    Text("A quotation from a source")
  }
}
```

### Preformatted text

```swift
import Slipstream

var body: some View {
  Preformatted {
    DOMString("""
    function hello() {
      console.log("Hello!");
    }
    """)
  }
}
```

### Figures

```swift
import Slipstream

var body: some View {
  Figure {
    Image(URL(string: "/image.jpg")!)
    FigureCaption {
      Text("Image caption")
    }
  }
}
```

### Details and Summary

```swift
import Slipstream

var body: some View {
  Details {
    Summary { Text("Click to expand") }
    Text("Hidden content revealed")
  }
}
```

### Dividers

```swift
var body: some View {
  Text("Section 1")
  Divider()
  Text("Section 2")
}
```

### Line breaks

```swift
import Slipstream

var body: some View {
  Paragraph {
    Text("Line 1")
    LineBreak()
    Text("Line 2")
  }
}
```

## Tables

Slipstream provides complete support for HTML table structures.

### Basic table

```swift
import Slipstream

var body: some View {
  Table {
    TableHeader {
      TableRow {
        TableHeaderCell { Text("Name") }
        TableHeaderCell { Text("Age") }
      }
    }
    TableBody {
      TableRow {
        TableCell { Text("Alice") }
        TableCell { Text("30") }
      }
      TableRow {
        TableCell { Text("Bob") }
        TableCell { Text("25") }
      }
    }
  }
}
```

### Table with caption

```swift
import Slipstream

var body: some View {
  Table {
    Caption { Text("User Data") }
    TableHeader {
      TableRow {
        TableHeaderCell { Text("Column 1") }
      }
    }
    TableBody {
      TableRow {
        TableCell { Text("Data") }
      }
    }
  }
}
```

### Table footer

```swift
import Slipstream

var body: some View {
  Table {
    TableBody {
      TableRow {
        TableCell { Text("Row 1") }
      }
    }
    TableFooter {
      TableRow {
        TableCell { Text("Total") }
      }
    }
  }
}
```

## Forms

Slipstream provides types for all HTML form elements.

### Basic form

```swift
import Slipstream

var body: some View {
  Form {
    Label("Name") {
      TextField(name: "username")
    }
    SubmitButton("Submit")
  }
}
```

### Text inputs

```swift
import Slipstream

var body: some View {
  TextField(name: "email", type: .email, placeholder: "Enter email")
  TextArea(name: "message", placeholder: "Your message")
}
```

### Buttons

```swift
import Slipstream

var body: some View {
  Button {
    Text("Click me")
  }
  SubmitButton("Submit form")
  ResetButton("Reset form")
}
```

### Checkboxes and radio buttons

```swift
import Slipstream

var body: some View {
  Checkbox(name: "agree", value: "yes")
  RadioButton(name: "choice", value: "option1")
}
```

### Select/Picker

```swift
import Slipstream

var body: some View {
  Picker {
    Option("Option 1", value: "1")
    Option("Option 2", value: "2")
    OptGroup(label: "Group") {
      Option("Option 3", value: "3")
    }
  }
}
```

### Other input types

```swift
import Slipstream

var body: some View {
  Slider(name: "volume", min: 0, max: 100)
  ColorPicker(name: "color")
  FileInput(name: "upload")
  HiddenField(name: "token", value: "abc123")
}
```

### Progress and Meter

```swift
import Slipstream

var body: some View {
  ProgressView(value: 0.75) {
    Text("75% complete")
  }
  Meter(value: 0.6, min: 0, max: 1) {
    Text("60%")
  }
}
```

### Fieldsets

```swift
import Slipstream

var body: some View {
  Fieldset {
    Legend { Text("Personal Information") }
    TextField(name: "name")
    TextField(name: "email", type: .email)
  }
}
```

## Images and Media

### Images

```swift
import Slipstream

var body: some View {
  Image(URL(string: "/photo.jpg")!)
    .accessibilityLabel("Photo description")
}
```

### Responsive images

```swift
import Slipstream

var body: some View {
  Picture {
    Source(
      srcset: "/wide.jpg",
      media: "(min-width: 800px)"
    )
    Image(URL(string: "/narrow.jpg")!)
  }
}
```

### Audio

```swift
import Slipstream

var body: some View {
  Audio(controls: true) {
    Source(src: "/audio.mp3", type: "audio/mpeg")
  }
}
```

### Video

```swift
import Slipstream

var body: some View {
  Video(controls: true) {
    Source(src: "/video.mp4", type: "video/mp4")
    Track(
      src: "/subtitles.vtt",
      kind: "subtitles",
      srclang: "en"
    )
  }
}
```

### Canvas

```swift
import Slipstream

var body: some View {
  Canvas(width: 800, height: 600) {
    Text("Canvas fallback content")
  }
}
```

### IFrame

```swift
import Slipstream

var body: some View {
  IFrame(src: URL(string: "https://example.com")!)
    .frame(width: 800, height: 600)
}
```

## SVG Graphics

Slipstream provides full support for SVG elements.

### Basic SVG

```swift
import Slipstream

var body: some View {
  SVG(width: 100, height: 100) {
    SVGCircle(
      cx: 50,
      cy: 50,
      r: 40,
      fill: .color(.red)
    )
  }
}
```

### SVG shapes

```swift
import Slipstream

var body: some View {
  SVG(width: 200, height: 100) {
    SVGRect(
      x: 10,
      y: 10,
      width: 180,
      height: 80,
      fill: .color(.blue)
    )
    SVGPath(
      d: "M 10,30 A 20,20 0,0,1 50,30",
      stroke: .color(.black),
      fill: .none
    )
  }
}
```

### SVG gradients

```swift
import Slipstream

var body: some View {
  SVG(width: 200, height: 100) {
    SVGDefs {
      SVGLinearGradient(id: "gradient") {
        SVGStop(offset: "0%", stopColor: .color(.red))
        SVGStop(offset: "100%", stopColor: .color(.blue))
      }
    }
    SVGRect(
      x: 0,
      y: 0,
      width: 200,
      height: 100,
      fill: .url("gradient")
    )
  }
}
```

## MathML

Slipstream provides full support for MathML mathematical notation.

### Basic math

```swift
import Slipstream

var body: some View {
  Math {
    MRow {
      MI("x")
      MO("=")
      MN("42")
    }
  }
}
```

### Fractions

```swift
import Slipstream

var body: some View {
  Math {
    MFrac {
      MN("1")
      MN("2")
    }
  }
}
```

### Square roots

```swift
import Slipstream

var body: some View {
  Math {
    MSqrt {
      MN("2")
    }
  }
}
```

### Superscripts and subscripts

```swift
import Slipstream

var body: some View {
  Math {
    MSup {
      MI("x")
      MN("2")
    }
  }
  Math {
    MSub {
      MI("a")
      MN("1")
    }
  }
}
```

## ViewBuilder Features

### ForEach

Iterate over collections to build views:

```swift
struct ContentView: View {
  let items = ["Apple", "Banana", "Orange"]

  var body: some View {
    VStack {
      ForEach(items, id: \.self) { item in
        Text(item)
      }
    }
  }
}
```

### Conditionals

```swift
struct ContentView: View {
  let showContent = true

  var body: some View {
    VStack {
      if showContent {
        Text("Content is visible")
      } else {
        Text("Content is hidden")
      }
    }
  }
}
```

## Markdown Support

Slipstream can render Markdown content as HTML:

```swift
import Slipstream

var body: some View {
  MarkdownText("""
  # Heading

  This is **bold** and this is *italic*.

  - List item 1
  - List item 2
  """)
}
```

## W3C Global Attributes

Slipstream supports all W3C global HTML attributes.

### Core attributes

```swift
import Slipstream

var body: some View {
  Text("Content")
    .id("unique-id")
    .className("css-class")
    .title("Tooltip text")
}
```

### Data attributes

```swift
import Slipstream

var body: some View {
  Text("Content")
    .data("key", "value")
}
```

### Accessibility

```swift
import Slipstream

var body: some View {
  Text("Content")
    .accessibilityLabel("Screen reader text")
}
```

### Language and direction

```swift
import Slipstream

var body: some View {
  Text("Content")
    .language("en")
    .dir(.ltr)
}
```

### Editing attributes

```swift
import Slipstream

var body: some View {
  Text("Editable content")
    .contentEditable(.true)
    .spellcheck(true)
}
```

### Interaction attributes

```swift
import Slipstream

var body: some View {
  Text("Draggable")
    .draggable(true)
  Text("Tab order")
    .tabindex(1)
  Button {
    Text("Disabled")
  }
  .disabled(true)
}
```

### Other attributes

```swift
import Slipstream

var body: some View {
  Text("Hidden")
    .hidden()
  Text("Inert")
    .inert(true)
  Text("Autofocus")
    .autofocus(true)
}
```

## Custom Modifiers and Environment

### Custom ViewModifiers

Apply custom view modifiers:

```swift
import Slipstream

struct CustomModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(.blue)
  }
}

var body: some View {
  Text("Custom modifier")
    .modifier(CustomModifier())
}
```

### Class modifiers

Apply CSS classes directly:

```swift
import Slipstream

var body: some View {
  Text("Content")
    .classModifier("my-custom-class")
}
```

### Attribute modifiers

Apply HTML attributes directly:

```swift
import Slipstream

var body: some View {
  Text("Content")
    .attributeModifier("data-custom" => "value")
}
```

### Custom Environment Keys

Define and use custom environment keys:

```swift
import Slipstream

struct PathKey: EnvironmentKey {
  static var defaultValue: String = "/"
}

extension EnvironmentValues {
  var path: String {
    get { self[PathKey.self] }
    set { self[PathKey.self] = newValue }
  }
}

struct MyView: View {
  @Environment(\.path) var path

  var body: some View {
    Text("Current path: \(path)")
  }
}

var body: some View {
  MyView()
    .environment(\.path, "/home")
}
```

## Additional View Types

### Container

Slipstream provides a ``Container`` type that maps to Tailwind CSS's container class:

```swift
import Slipstream

var body: some View {
  Container {
    Text("Centered, max-width content")
  }
}
```

### Dialog

```swift
import Slipstream

var body: some View {
  Dialog(open: true) {
    Text("Dialog content")
  }
}
```

### Comment

Add HTML comments:

```swift
import Slipstream

var body: some View {
  Comment("This is an HTML comment")
  Text("Visible content")
}
```

### Raw HTML

Render raw HTML strings:

```swift
import Slipstream

var body: some View {
  DOMString("<div class='custom'>Raw HTML</div>")
}
```

## Pointer and Cursor

Control cursor appearance:

```swift
import Slipstream

var body: some View {
  Text("Clickable")
    .pointerStyle(.pointer)
  Text("Not allowed")
    .pointerStyle(.notAllowed)
}
```

## Opacity

Control element opacity:

```swift
var body: some View {
  Text("Semi-transparent")
    .opacity(0.5)
  Text("Fully transparent")
    .opacity(0)
}
```

## Transitions

Apply CSS transitions:

```swift
import Slipstream

var body: some View {
  Text("Smooth transition")
    .transition(.all)
}
```
