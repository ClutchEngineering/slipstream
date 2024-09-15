# Slipstream for Tailwind CSS developers

An exhaustive comparison of Slipstream features to equivalent Tailwind CSS features.

Slipstream aims to provide an implementation of every [Tailwind CSS utility](https://tailwindcss.com/docs/utility-first).
The remaining work is being tracked by the following issues on GitHub:

- [Implement the full suite of Tailwind CSS modifiers](https://github.com/jverkoey/slipstream/issues/51)

## Layout

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Aspect Ratio](https://tailwindcss.com/docs/aspect-ratio) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Container](https://tailwindcss.com/docs/container) | ``Container``
[Columns](https://tailwindcss.com/docs/columns) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Break After](https://tailwindcss.com/docs/break-after) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Break Before](https://tailwindcss.com/docs/break-before) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Break Inside](https://tailwindcss.com/docs/break-inside) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Box Decoration Break](https://tailwindcss.com/docs/box-decoration-break) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Box Sizing](https://tailwindcss.com/docs/box-sizing) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Display](https://tailwindcss.com/docs/display) | ``View/display(_:condition:)``
[Floats](https://tailwindcss.com/docs/float) | ``View/float(_:condition:)``
[Clear](https://tailwindcss.com/docs/clear) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Isolation](https://tailwindcss.com/docs/isolation) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Object Fit](https://tailwindcss.com/docs/object-fit) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Object Position](https://tailwindcss.com/docs/object-position) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Overflow](https://tailwindcss.com/docs/overflow) | ``View/overflow(_:condition:)``, ``View/overflow(_:axis:condition:)``
[Overscroll Behavior](https://tailwindcss.com/docs/overscroll-behavior) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Position](https://tailwindcss.com/docs/position) | ``View/position(_:condition:)``
[Top / Right / Bottom / Left](https://tailwindcss.com/docs/top-right-bottom-left) | ``View/placement(inset:condition:)``, ``View/placement(x:y:condition:)``, ``View/placement(left:right:top:bottom:condition:)``
[Visibility](https://tailwindcss.com/docs/visibility) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Z-Index](https://tailwindcss.com/docs/z-index) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Flexbox & Grid

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Flex Basis](https://tailwindcss.com/docs/flex-basis) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Flex Direction](https://tailwindcss.com/docs/flex-direction) | ``View/flexDirection(_:reversed:condition:)``
[Flex Wrap](https://tailwindcss.com/docs/flex-wrap) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Flex](https://tailwindcss.com/docs/flex) | ``View/display(_:condition:)``
[Flex Grow](https://tailwindcss.com/docs/flex-grow) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Flex Shrink](https://tailwindcss.com/docs/flex-shrink) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Order](https://tailwindcss.com/docs/order) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Template Columns](https://tailwindcss.com/docs/grid-template-columns) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Column Start / End](https://tailwindcss.com/docs/grid-column) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Template Rows](https://tailwindcss.com/docs/grid-template-rows) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Row Start / End](https://tailwindcss.com/docs/grid-row) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Auto Flow](https://tailwindcss.com/docs/grid-auto-flow) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Auto Columns](https://tailwindcss.com/docs/grid-auto-columns) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grid Auto Rows](https://tailwindcss.com/docs/grid-auto-rows) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Gap](https://tailwindcss.com/docs/gap) | ``View/flexGap(_:width:condition:)``
[Justify Content](https://tailwindcss.com/docs/justify-content) | ``View/justifyContent(_:condition:)``
[Justify Items](https://tailwindcss.com/docs/justify-items) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Justify Self](https://tailwindcss.com/docs/justify-self) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Align Content](https://tailwindcss.com/docs/align-content) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Align Items](https://tailwindcss.com/docs/align-items) | ``View/alignItems(_:condition:)
[Align Self](https://tailwindcss.com/docs/align-self) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Place Content](https://tailwindcss.com/docs/place-content) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Place Items](https://tailwindcss.com/docs/place-items) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Place Self](https://tailwindcss.com/docs/place-self) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Spacing

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Padding](https://tailwindcss.com/docs/padding) | ``View/padding(_:condition:)``, ``View/padding(_:_:condition:)``
[Margin](https://tailwindcss.com/docs/margin) | ``View/margin(_:condition:)-7p7l1``, ``View/margin(_:condition:)-6bjcp``, ``View/margin(_:_:condition:)-3yers``, ``View/margin(_:_:condition:)-13cc5``, ``View/margin(_:_:condition:)-4cyt1``
[Space Between](https://tailwindcss.com/docs/space) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Sizing

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Width](https://tailwindcss.com/docs/width) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Min-Width](https://tailwindcss.com/docs/min-width) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Max-Width](https://tailwindcss.com/docs/max-width) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Height](https://tailwindcss.com/docs/height) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Min-Height](https://tailwindcss.com/docs/min-height) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Max-Height](https://tailwindcss.com/docs/max-height) | ``View/frame(minWidth:width:maxWidth:minHeight:height:maxHeight:condition:)``
[Size](https://tailwindcss.com/docs/size) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Typography

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Font Family](https://tailwindcss.com/docs/font-family) | ``View/fontDesign(_:condition:)-6ndfl``, ``View/fontDesign(_:condition:)-6ndfl``
[Font Size](https://tailwindcss.com/docs/font-size) | ``View/fontSize(_:condition:)-8uo73``, ``View/fontSize(_:condition:)-8lb7v``
[Font Smoothing](https://tailwindcss.com/docs/font-smoothing) | ``View/fontSmoothing(_:condition:)``, ``View/antialiased(condition:)``
[Font Style](https://tailwindcss.com/docs/font-style) | ``View/fontStyle(_:condition:)``
[Font Weight](https://tailwindcss.com/docs/font-weight) | ``View/fontWeight(_:condition:)-100c5``, ``View/fontWeight(_:condition:)-5zmpr``, ``View/bold(condition:)``
[Font Variant Numeric](https://tailwindcss.com/docs/font-variant-numeric) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Letter Spacing](https://tailwindcss.com/docs/letter-spacing) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Line Clamp](https://tailwindcss.com/docs/line-clamp) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Line Height](https://tailwindcss.com/docs/line-height) | ``View/fontLeading(_:condition:)-q5dg``, ``View/fontLeading(_:condition:)-64d84``
[List Style Image](https://tailwindcss.com/docs/list-style-image) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[List Style Position](https://tailwindcss.com/docs/list-style-position) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[List Style Type](https://tailwindcss.com/docs/list-style-type) | ``View/listStyle(_:condition:)``
[Text Align](https://tailwindcss.com/docs/text-align) | ``View/textAlignment(_:condition:)``
[Text Color](https://tailwindcss.com/docs/text-color) | ``View/textColor(_:condition:)``
[Text Decoration](https://tailwindcss.com/docs/text-decoration) | ``View/textDecoration(_:color:condition:)``, ``View/underline(color:condition:)``
[Text Decoration Color](https://tailwindcss.com/docs/text-decoration-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Decoration Style](https://tailwindcss.com/docs/text-decoration-style) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Decoration Thickness](https://tailwindcss.com/docs/text-decoration-thickness) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Underline Offset](https://tailwindcss.com/docs/text-underline-offset) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Transform](https://tailwindcss.com/docs/text-transform) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Overflow](https://tailwindcss.com/docs/text-overflow) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Wrap](https://tailwindcss.com/docs/text-wrap) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Text Indent](https://tailwindcss.com/docs/text-indent) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Vertical Align](https://tailwindcss.com/docs/vertical-align) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Whitespace](https://tailwindcss.com/docs/whitespace) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Word Break](https://tailwindcss.com/docs/word-break) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Hyphens](https://tailwindcss.com/docs/hyphens) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Content](https://tailwindcss.com/docs/content) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

### Font weights

SwiftUI and Tailwind CSS' font weight names are not aligned. Slipstream has opted to use SwiftUI's
font weight names. The mapping of values is provided below:

SwiftUI font weight | Tailwind CSS font weight
:-------------------|:------------------------
``FontWeight/ultralight`` | thin
``FontWeight/thin`` | extralight
``FontWeight/light`` | light
``FontWeight/regular`` | normal
``FontWeight/medium`` | medium
``FontWeight/semibold`` | semibold
``FontWeight/bold`` | bold
``FontWeight/heavy`` | extrabold
``FontWeight/black`` | black

## Backgrounds

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Background Attachment](https://tailwindcss.com/docs/background-attachment) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Clip](https://tailwindcss.com/docs/background-clip) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Color](https://tailwindcss.com/docs/background-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Origin](https://tailwindcss.com/docs/background-origin) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Position](https://tailwindcss.com/docs/background-position) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Repeat](https://tailwindcss.com/docs/background-repeat) | ``View/background(_:size:repeat:condition:)``
[Background Size](https://tailwindcss.com/docs/background-size) | ``View/background(_:size:repeat:condition:)``
[Background Image](https://tailwindcss.com/docs/background-image) | ``View/background(_:size:repeat:condition:)``
[Gradient Color Stops](https://tailwindcss.com/docs/gradient-color-stops) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Borders

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Border Radius](https://tailwindcss.com/docs/border-radius) | ``View/cornerRadius(_:condition:)-n56e``, ``View/cornerRadius(_:condition:)-6tvub``
[Border Width](https://tailwindcss.com/docs/border-width) | ``View/border(_:width:edges:condition:)``
[Border Color](https://tailwindcss.com/docs/border-color) | ``View/border(_:width:edges:condition:)``
[Border Style](https://tailwindcss.com/docs/border-style) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Divide Width](https://tailwindcss.com/docs/divide-width) | ``View/border(_:width:edges:condition:)``
[Divide Color](https://tailwindcss.com/docs/divide-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Divide Style](https://tailwindcss.com/docs/divide-style) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Outline Width](https://tailwindcss.com/docs/outline-width) | ``View/outline(_:width:condition:)``, ``View/outline(_:width:style:condition:)``
[Outline Color](https://tailwindcss.com/docs/outline-color) | ``View/outline(_:width:condition:)``, ``View/outline(_:width:style:condition:)``
[Outline Style](https://tailwindcss.com/docs/outline-style) | ``View/outline(_:width:style:condition:)``
[Outline Offset](https://tailwindcss.com/docs/outline-offset) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Ring Width](https://tailwindcss.com/docs/ring-width) | ``View/ring(_:width:condition:)``
[Ring Color](https://tailwindcss.com/docs/ring-color) | ``View/ring(_:width:condition:)``
[Ring Offset Width](https://tailwindcss.com/docs/ring-offset-width) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Ring Offset Color](https://tailwindcss.com/docs/ring-offset-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Effects

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Box Shadow](https://tailwindcss.com/docs/box-shadow) | ``View/shadow(color:radius:condition:)``
[Box Shadow Color](https://tailwindcss.com/docs/box-shadow-color) | ``View/shadow(color:radius:condition:)
[Opacity](https://tailwindcss.com/docs/opacity) | ``View/opacity(_:condition:)``
[Mix Blend Mode](https://tailwindcss.com/docs/mix-blend-mode) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Background Blend Mode](https://tailwindcss.com/docs/background-blend-mode) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Filters

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Blur](https://tailwindcss.com/docs/blur) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Brightness](https://tailwindcss.com/docs/brightness) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Contrast](https://tailwindcss.com/docs/contrast) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Drop Shadow](https://tailwindcss.com/docs/drop-shadow) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Grayscale](https://tailwindcss.com/docs/grayscale) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Hue Rotate](https://tailwindcss.com/docs/hue-rotate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Invert](https://tailwindcss.com/docs/invert) | ``View/colorInvert(condition:)``
[Saturate](https://tailwindcss.com/docs/saturate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Sepia](https://tailwindcss.com/docs/sepia) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Blur](https://tailwindcss.com/docs/backdrop-blur) | ``View/background(_:condition:)-89gyc``
[Backdrop Brightness](https://tailwindcss.com/docs/backdrop-brightness) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Contrast](https://tailwindcss.com/docs/backdrop-contrast) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Grayscale](https://tailwindcss.com/docs/backdrop-grayscale) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Hue Rotate](https://tailwindcss.com/docs/backdrop-hue-rotate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Invert](https://tailwindcss.com/docs/backdrop-invert) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Opacity](https://tailwindcss.com/docs/backdrop-opacity) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Saturate](https://tailwindcss.com/docs/backdrop-saturate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Backdrop Sepia](https://tailwindcss.com/docs/backdrop-sepia) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Tables

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Border Collapse](https://tailwindcss.com/docs/border-collapse) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Border Spacing](https://tailwindcss.com/docs/border-spacing) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Table Layout](https://tailwindcss.com/docs/table-layout) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Caption Side](https://tailwindcss.com/docs/caption-side) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Transitions & Animation

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Transition Property](https://tailwindcss.com/docs/transition-property) | ``View/transition(_:condition:)``
[Transition Duration](https://tailwindcss.com/docs/transition-duration) | ``View/animation(_:condition:)``, ``Animation``
[Transition Timing Function](https://tailwindcss.com/docs/transition-timing-function) | ``View/animation(_:condition:)``, ``Animation``
[Transition Delay](https://tailwindcss.com/docs/transition-delay) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Animation](https://tailwindcss.com/docs/animation) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Transforms

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Scale](https://tailwindcss.com/docs/scale) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Rotate](https://tailwindcss.com/docs/rotate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Translate](https://tailwindcss.com/docs/translate) | ``View/offset(x:y:condition:)``
[Skew](https://tailwindcss.com/docs/skew) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Transform Origin](https://tailwindcss.com/docs/transform-origin) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## Interactivity

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Accent Color](https://tailwindcss.com/docs/accent-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Appearance](https://tailwindcss.com/docs/appearance) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Cursor](https://tailwindcss.com/docs/cursor) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Caret Color](https://tailwindcss.com/docs/caret-color) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Pointer Events](https://tailwindcss.com/docs/pointer-events) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Resize](https://tailwindcss.com/docs/resize) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Behavior](https://tailwindcss.com/docs/scroll-behavior) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Margin](https://tailwindcss.com/docs/scroll-margin) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Padding](https://tailwindcss.com/docs/scroll-padding) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Snap Align](https://tailwindcss.com/docs/scroll-snap-align) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Snap Stop](https://tailwindcss.com/docs/scroll-snap-stop) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Scroll Snap Type](https://tailwindcss.com/docs/scroll-snap-type) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Touch Action](https://tailwindcss.com/docs/touch-action) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[User Select](https://tailwindcss.com/docs/user-select) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Will Change](https://tailwindcss.com/docs/will-change) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)

## SVG

Tailwind utility | Slipstream modifier
:----------------|:-------------------
[Fill](https://tailwindcss.com/docs/fill) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Stroke](https://tailwindcss.com/docs/stroke) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
[Stroke Width](https://tailwindcss.com/docs/stroke-width) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/51)
