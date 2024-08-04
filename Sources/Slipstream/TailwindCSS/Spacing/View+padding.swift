extension View {
  /// Set the padding for specific edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to which padding should be applied.
  ///   - length: The size of the padding to apply, in points. If the padding is exactly between
  ///   two padding classes, then the smaller padding class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`padding`](https://tailwindcss.com/docs/padding) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func padding(_ edges: Edge.Set = .all, _ length: Double, condition: Condition? = nil) -> some View {
    let spacingClass = Edge.pointToTailwindSpacingClass(ptLength: length)
    var classes = [String]()

    if Edge.Set.all.isSubset(of: edges) {
      classes = ["p-" + spacingClass]
    } else {
      if Edge.Set.horizontal.isSubset(of: edges) {
        classes.append("px-" + spacingClass)
      } else {
        if edges.contains(.left) {
          classes.append("pl-" + spacingClass)
        }
        if edges.contains(.right) {
          classes.append("pr-" + spacingClass)
        }
      }
      if Edge.Set.vertical.isSubset(of: edges) {
        classes.append("py-" + spacingClass)
      } else {
        if edges.contains(.top) {
          classes.append("pt-" + spacingClass)
        }
        if edges.contains(.bottom) {
          classes.append("pb-" + spacingClass)
        }
      }
    }
    return modifier(
      TailwindClassModifier(add: classes.joined(separator: " "), condition: condition)
    )
  }

  /// Set the padding for all edges.
  ///
  /// - Parameters:
  ///   - length: The size of the padding to apply, in points. If the padding is exactly between
  ///   two padding classes, then the smaller padding class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.   
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func padding(_ length: Double, condition: Condition? = nil) -> some View {
    padding(.all, length, condition: condition)
  }
}
