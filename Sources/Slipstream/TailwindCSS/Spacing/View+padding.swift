extension View {
  /// Set the padding for specific edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to which padding should be applied.
  ///   - length: The size of the padding to apply, in points. If the padding is exactly between
  /// two padding classes, then the smaller padding class will be used.
  ///
  /// - SeeAlso: Tailwind CSS' [`padding`](https://tailwindcss.com/docs/padding) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func padding(_ edges: Edge.Set, _ length: Double) -> some View {
    let paddingClass = closestTailwindPadding(ptLength: length)
    var classes = [String]()

    if edges == .all {
      classes = ["p-" + paddingClass]
    } else {
      if Edge.Set.horizontal.isSubset(of: edges) {
        classes.append("px-" + paddingClass)
      } else {
        if edges.contains(.left) {
          classes.append("pl-" + paddingClass)
        }
        if edges.contains(.right) {
          classes.append("pr-" + paddingClass)
        }
      }
      if Edge.Set.vertical.isSubset(of: edges) {
        classes.append("py-" + paddingClass)
      } else {
        if edges.contains(.top) {
          classes.append("pt-" + paddingClass)
        }
        if edges.contains(.bottom) {
          classes.append("pb-" + paddingClass)
        }
      }
    }
    return self.modifier(ClassModifier(add: classes.joined(separator: " ")))
  }

  /// Map a point size to the closest Tailwind CSS padding class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS padding class string.
  @available(iOS 17.0, macOS 14.0, *)
  private func closestTailwindPadding(ptLength: Double) -> String {
    // Tailwind padding classes and their corresponding sizes in points
    let paddingMapping: [(paddingClass: String, ptLength: Double)] = [
      ("0", 0),    // 0pt
      ("0.5", 2),  // 0.125rem
      ("1", 4),    // 0.25rem
      ("1.5", 6),  // 0.375rem
      ("2", 8),    // 0.5rem
      ("2.5", 10), // 0.625rem
      ("3", 12),   // 0.75rem
      ("3.5", 14), // 0.875rem
      ("4", 16),   // 1rem
      ("5", 20),   // 1.25rem
      ("6", 24),   // 1.5rem
      ("7", 28),   // 1.75rem
      ("8", 32),   // 2rem
      ("9", 36),   // 2.25rem
      ("10", 40),  // 2.5rem
      ("11", 44),  // 2.75rem
      ("12", 48),  // 3rem
      ("14", 56),  // 3.5rem
      ("16", 64),  // 4rem
      ("20", 80),  // 5rem
      ("24", 96),  // 6rem
      ("28", 112), // 7rem
      ("32", 128), // 8rem
      ("36", 144), // 9rem
      ("40", 160), // 10rem
      ("44", 176), // 11rem
      ("48", 192), // 12rem
      ("52", 208), // 13rem
      ("56", 224), // 14rem
      ("60", 240), // 15rem
      ("64", 256), // 16rem
      ("72", 288), // 18rem
      ("80", 320), // 20rem
      ("96", 384)  // 24rem
    ]

    // Find the closest matching padding size class
    let closestPadding = paddingMapping.min { abs($0.ptLength - ptLength) < abs($1.ptLength - ptLength) }
    return closestPadding?.paddingClass ?? "0"
  }
}
