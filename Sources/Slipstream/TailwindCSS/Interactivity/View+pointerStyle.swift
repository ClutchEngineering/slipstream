/// Constants that specify the pointer style to display when hovering over a view.
///
/// - SeeAlso: Tailwind CSS' [cursor](https://tailwindcss.com/docs/cursor) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum PointerStyle: String {
  case automatic = "auto"
  case `default` = "default"
  case pointer = "pointer"
  case wait = "wait"
  case text = "text"
  case move = "move"
  case help = "help"
  case notAllowed = "not-allowed"
  case none = "none"
  case contextMenu = "context-menu"
  case progress = "progress"
  case cell = "cell"
  case crosshair = "crosshair"
  case verticalText = "vertical-text"
  case alias = "alias"
  case copy = "copy"
  case noDrop = "no-drop"
  case grab = "grab"
  case grabbing = "grabbing"
  case allScroll = "all-scroll"
  case columnResize = "col-resize"
  case rowResize = "row-resize"
  case northResize = "n-resize"
  case eastResize = "e-resize"
  case southResize = "s-resize"
  case westResize = "w-resize"
  case northEastResize = "ne-resize"
  case northWestResize = "nw-resize"
  case southEastResize = "se-resize"
  case southWestResize = "sw-resize"
  case eastWestResize = "ew-resize"
  case northSouthResize = "ns-resize"
  case northEastSouthWestResize = "nesw-resize"
  case northWestSouthEastResize = "nwse-resize"
  case zoomIn = "zoom-in"
  case zoomOut = "zoom-out"
}

extension View {
  /// Sets the pointer style for the view.
  ///
  /// - Parameters:
  ///   - pointerStyle: The pointer style to display when hovering over the view.
  ///   - condition: An optional condition that controls when this style is applied.
  ///
  /// - SeeAlso: Tailwind CSS' [cursor](https://tailwindcss.com/docs/cursor) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func pointerStyle(_ pointerStyle: PointerStyle, condition: Condition? = nil) -> some View {
    modifier(TailwindClassModifier(add: "cursor-" + pointerStyle.rawValue, condition: condition))
  }
}