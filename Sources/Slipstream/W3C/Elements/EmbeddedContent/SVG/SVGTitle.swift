import SwiftSoup

/// A view that represents an SVG `<title>` element.
///
/// The `<title>` element provides an accessible short-text description of any SVG element,
/// typically used as a tooltip or for screen readers. The content is not visually rendered
/// as part of the graphics.
///
/// Example:
/// ```swift
/// SVG(viewBox: "0 0 100 100") {
///     SVGTitle("A red circle")
///     SVGCircle(cx: "50", cy: "50", r: "40")
///         .modifier(ClassModifier(add: "fill-red-500"))
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct SVGTitle<ChildContent: View>: W3CElement {
    public let tagName = "title"
    
    @ViewBuilder public let content: @Sendable () -> ChildContent
    
    /// Creates an SVGTitle element with view content.
    ///
    /// - Parameter content: The view content for the title
    public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
        self.content = content
    }
}

@available(iOS 17.0, macOS 14.0, *)
extension SVGTitle where ChildContent == DOMString {
    /// Creates an SVGTitle element with text content.
    ///
    /// - Parameter text: The title text content
    public init(_ text: String) {
        self.content = { 
            DOMString(text)
        }
    }
}
