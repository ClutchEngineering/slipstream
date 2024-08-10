extension View {
  /// Change the dimensions of the view.
  public func frame(
    minWidth: FrameMinWidthValue? = nil,
    width: FrameWidthValue? = nil,
    maxWidth: FrameMaxWidthValue? = nil,
    minHeight: FrameMinHeightValue? = nil,
    height: FrameHeightValue? = nil,
    maxHeight: FrameMaxHeightValue? = nil,
    condition: Condition? = nil
  ) -> some View {
    var classNames: [String] = []
    if let tailwindSizingClass = minWidth?.tailwindSizingClass {
      classNames.append("min-w-\(tailwindSizingClass)")
    }
    if let tailwindSizingClass = width?.tailwindSizingClass {
      classNames.append("w-\(tailwindSizingClass)")
    }
    if let tailwindSizingClass = maxWidth?.tailwindSizingClass {
      classNames.append("max-w-\(tailwindSizingClass)")
    }
    if let tailwindSizingClass = minHeight?.tailwindSizingClass {
      classNames.append("min-h-\(tailwindSizingClass)")
    }
    if let tailwindSizingClass = height?.tailwindSizingClass {
      classNames.append("h-\(tailwindSizingClass)")
    }
    if let tailwindSizingClass = maxHeight?.tailwindSizingClass {
      classNames.append("max-h-\(tailwindSizingClass)")
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }
}
