import SwiftSoup

/// A view that represents a MathML mathematical expression container.
///
/// Math provides a declarative way to include mathematical notation in your document
/// using MathML (Mathematical Markup Language).
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MI("x")
///           MO("=")
///           MFrac {
///             MRow {
///               MO("-")
///               MI("b")
///               MO("±")
///               MSqrt {
///                 MRow {
///                   MSup {
///                     MI("b")
///                     MN("2")
///                   }
///                   MO("-")
///                   MN("4")
///                   MI("a")
///                   MI("c")
///                 }
///               }
///             }
///             MRow {
///               MN("2")
///               MI("a")
///             }
///           }
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [math](https://www.w3.org/TR/MathML3/chapter2.html#interf.toplevel) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Math<Content>: View where Content: View {
  /// Creates a Math view.
  ///
  /// - Parameters:
  ///   - content: The MathML content to render within this container.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
    self.displayValue = nil
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("math")
    if let display = displayValue {
      try element.attr("display", display)
    }
    try self.content().render(element, environment: environment)
  }

  /// Sets the display style of the math element.
  ///
  /// - Parameter display: The display mode ("block" or "inline")
  /// - Returns: A new Math with the specified display mode.
  public func display(_ display: String) -> Math {
    var newMath = self
    newMath.displayValue = display
    return newMath
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private var displayValue: String?
}
