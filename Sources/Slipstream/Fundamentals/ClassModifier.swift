import SwiftSoup

/// A modifier that adds class attributes to the views it is modifying.
///
/// You will rarely interact with this type directly, it is used primarily when
/// creating view modifiers that need to adjust one or more HTML
/// attributes.
///
/// Note that attempting to modify an attribute on a ``Text`` view will result in
/// the attribute being silently ignored.
///
/// If you are building a new attribute modifier, it will typically look something
/// like this:
///
/// ```swift
/// extension View {
///   public func language(_ language: String) -> some View {
///     return modifier(ClassModifier(add: ["foo", "bar"]))
///   }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct ClassModifier<T: View>: ViewModifier {
  /// Creates a class modifier that will add `className` to any modified views's `class` attribute.
  ///
  /// - Parameters:
  ///   - className: The class name to be added.
  public init(add className: String) {
    self.init(add: Set([className]))
  }

  /// Creates a class modifier that will add `classNames` to any modified views's `class` attribute.
  ///
  /// - Parameters:
  ///   - classNames: The set of class name to be added.
  public init(add classNames: Set<String>) {
    self.classNames = Set(classNames
      .flatMap { $0.components(separatedBy: .whitespaces) }
      .filter { !$0.isEmpty }
    )
  }

  @_documentation(visibility: private)
  @ViewBuilder
  public func body(content: T) -> some View {
    ClassModifierView(classNames: classNames) {
      content
    }
  }

  private let classNames: Set<String>
}

private struct ClassModifierView<Content: View>: View {
  init(classNames: Set<String>, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.classNames = classNames
    self.content = content
  }

  func render(_ container: Element, environment: EnvironmentValues) throws {
    let shadowDOM = Document("")
    try self.content().render(shadowDOM, environment: environment)
    for child in shadowDOM.children() {
      for className in classNames.sorted() {
        try child.addClass(className)
      }
    }
    for child in shadowDOM.getChildNodes() {
      try container.appendChild(child)
    }
  }

  private let classNames: Set<String>
  private let content: @Sendable () -> Content
}

