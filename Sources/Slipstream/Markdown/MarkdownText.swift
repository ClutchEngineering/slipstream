import Markdown
import SwiftSoup

/// A view that renders markdown as Slipstream views.
///
/// MarkdownText requires that you implement a builder in order to
/// translate markdown nodes into styled Slipstream views. An
/// example, but incomplete, implementation is provided below.
/// Note that Slipstream and Markdown both define identical
/// types in many cases (e.g. Text, Heading, Paragraph), so
/// the types need to be disambiguated.
///
/// ```swift
/// import Markdown
/// import Slipstream
/// 
/// MarkdownText("""
/// ## Hello world
///
/// This is some markdown content.
/// """
/// ) { node, context in
///   switch node {
///   case let text as Markdown.Text:
///     Slipstream.Text(text.string)
///   case let heading as Markdown.Heading:
///     Slipstream.Heading(level: heading.level) {
///       context.recurse()
///     }
///   case is Markdown.Paragraph:
///     Slipstream.Paragraph {
///       context.recurse()
///     }
///   default:
///     context.recurse()
///   }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct MarkdownText: View {
  let node: Markup

  public typealias BuilderBlock = (Markup, MarkdownText) -> any View

  @ViewBuilder let builder: BuilderBlock

  public init(_ markdownString: String, @ViewBuilder builder: @escaping BuilderBlock) {
    self.node = Document(parsing: markdownString)
    self.builder = builder
  }

  public init(_ node: Markup, @ViewBuilder builder: @escaping BuilderBlock) {
    self.node = node
    self.builder = builder
  }

  @ViewBuilder
  public var body: some View {
    for child in node.children {
      AnyView(builder(child, Self(child, builder: builder)))
    }
  }

  @ViewBuilder
  public func recurse() -> some View {
    MarkdownText(node, builder: builder)
  }
}
