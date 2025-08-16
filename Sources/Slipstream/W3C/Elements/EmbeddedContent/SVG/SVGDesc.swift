import SwiftSoup

/// A view that represents an SVG `<desc>` element.
///
/// The `<desc>` element provides a detailed description of any SVG element,
/// used for accessibility purposes by screen readers and other assistive technologies.
/// The content is not visually rendered as part of the graphics.
///
/// Example:
/// ```swift
/// SVG(viewBox: "0 0 100 100") {
///     SVGDesc("This graphic shows a red circle centered in a 100x100 viewport")
///     SVGCircle(cx: "50", cy: "50", r: "40")
///         .modifier(ClassModifier(add: "fill-red-500"))
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct SVGDesc<ChildContent: View>: W3CElement {
    public let tagName = "desc"
    
    @ViewBuilder public let content: @Sendable () -> ChildContent
    
    /// Creates an SVGDesc element with view content.
    ///
    /// - Parameter content: The view content for the description
    public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
        self.content = content
    }
}

@available(iOS 17.0, macOS 14.0, *)
extension SVGDesc where ChildContent == DOMString {
    /// Creates an SVGDesc element with text content.
    ///
    /// - Parameter text: The description text content
    public init(_ text: String) {
        self.content = { 
            DOMString(text)
        }
    }
}
