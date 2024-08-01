/// A modifier that you apply to a view or another view modifier, producing a
/// different version of the original value.
///
/// Adopt the ``ViewModifier`` protocol when you want to create a reusable
/// modifier that you can apply to any view.
///
/// You can apply ``View/modifier(_:)`` directly to a view, but a more common
/// and idiomatic approach uses ``View/modifier(_:)`` to define an extension to
/// ``View`` itself that incorporates the view modifier:
///
/// ```swift
/// extension View {
///   func indented() -> some View {
///     modifier(Indented())
///   }
/// }
/// ```
///
/// You can then apply indented to any view, similar to this:
///
/// ```swift
/// Text("Downtown Bus")
///   .indented()
/// ```
@available(iOS 17.0, macOS 14.0, *)
public protocol ViewModifier {
  /// The type of view representing the body.
  associatedtype Body: View

  /// The content view type passed to `body()`.
  associatedtype Content: View

  /// Gets the current body of the caller.
  ///
  /// `content` is a proxy for the view that will have the modifier
  /// represented by `Self` applied to it. You will typically include a reference
  /// to `content` somewhere in the implementation of this method.
  @ViewBuilder func body(content: Self.Content) -> Self.Body
}
