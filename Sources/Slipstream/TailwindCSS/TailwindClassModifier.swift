import SwiftSoup

/// A modifier that adds class attributes to the views it is modifying with support
/// for Tailwind breakpoints and state.
@available(iOS 17.0, macOS 14.0, *)
struct TailwindClassModifier<T: View>: ViewModifier {
  /// Creates a class modifier that will add `className` to any modified views's `class` attribute.
  ///
  /// - Parameters:
  ///   - className: The class name to be added.
  ///   - minBreakpoint: The minimum breakpoint from which this class should be applied.
  public init(add className: String, condition: Condition?) {
    self.init(add: Set([className]), condition: condition)
  }

  /// Creates a class modifier that will add `classNames` to any modified views's `class` attribute.
  ///
  /// - Parameters:
  ///   - classNames: The set of class name to be added.
  ///   - minBreakpoint: The minimum breakpoint from which this class should be applied.
  public init(add classNames: Set<String>, condition: Condition?) {
    self.classNames = Set(classNames
      .flatMap { $0.components(separatedBy: .whitespaces) }
      .filter { !$0.isEmpty }
    )
    self.condition = condition
  }

  @_documentation(visibility: private)
  @ViewBuilder
  public func body(content: T) -> some View {
    TailwindClassModifierView(classNames: classNames, condition: condition) {
      content
    }
  }

  private let classNames: Set<String>
  private let condition: Condition?
}

private struct TailwindClassModifierView<Content: View>: View {
  init(classNames: Set<String>, condition: Condition?, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.classNames = classNames
    self.condition = condition
    self.content = content
  }

  func render(_ container: Element, environment: EnvironmentValues) throws {
    let shadowDOM = Document("")
    try self.content().render(shadowDOM, environment: environment)
    for child in shadowDOM.children() {
      for className in classNames.sorted() {
        if let condition {
          try child.addClass("\(condition.tailwindClassModifiers):\(className)")
        } else {
          try child.addClass(className)
        }
      }
    }
    for child in shadowDOM.getChildNodes() {
      try container.appendChild(child)
    }
  }
  
  public func style(environment: EnvironmentValues) async throws {
    try await self.content().style(environment: environment)
  }

  private let classNames: Set<String>
  private let condition: Condition?
  private let content: @Sendable () -> Content
}

