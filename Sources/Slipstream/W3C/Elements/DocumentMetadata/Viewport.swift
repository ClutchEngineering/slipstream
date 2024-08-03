import Foundation

import SwiftSoup

/// A view that defines how the document should render its content in relation to the
/// browser's viewport.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Viewport(width: .deviceWidth, initialScale: 1)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C public working draft for [`viewport`](https://drafts.csswg.org/css-viewport) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Viewport: View {
  /// A value that can be used for a viewport dimension.
  public enum Dimension {
    /// The viewport should be rendered using the device's width.
    case deviceWidth
    /// The viewport should be rendered using the device's height.
    case deviceHeight
    /// The viewport should be rendered at an exact pixel dimension.
    case pixels(Int)

    fileprivate var asString: String {
      switch self {
      case .deviceWidth:        return "device-width"
      case .deviceHeight:       return "device-height"
      case .pixels(let pixels): return "\(pixels)"
      }
    }
  }

  /// The standard viewport used for mobile-friendly websites.
  public static let mobileFriendly = Self.init(width: .deviceWidth, initialScale: 1)

  /// Creates a Viewport view.
  ///
  /// If no parameters are provided, then this view will be treated like an ``EmptyView``.
  ///
  /// - Parameters:
  ///   - width: The width at which the document should be rendered.
  ///   - height: The height at which the document should be rendered.
  ///   - initialScale: The initial scale at which the document should be rendered.
  ///   - minimumScale: The minimum scale allowed on the document. This affects the user's ability
  ///   to scale the web page and should rarely be used.
  ///   - maximumScale: The maximum scale allowed on the document. This affects the user's ability
  ///   to scale the web page and should rarely be used.
  ///   - userScalable: Whether or not the user is allowed to scale the document. Should rarely be used.
  public init(
    width: Dimension? = nil,
    height: Dimension? = nil,
    initialScale: Double? = nil,
    minimumScale: Double? = nil,
    maximumScale: Double? = nil,
    userScalable: Bool? = nil
  ) {
    self.width = width
    self.height = height
    self.initialScale = initialScale
    self.minimumScale = minimumScale
    self.maximumScale = maximumScale
    self.userScalable = userScalable
  }

  @_documentation(visibility: private)
  public var body: some View {
    if let content {
      Meta("viewport", content: content)
    }
  }

  private var content: String? {
    let content = [
      ("width", width?.asString),
      ("height", height?.asString),
      ("initial-scale", initialScale?.asString),
      ("minimum-scale", minimumScale?.asString),
      ("maximum-scale", maximumScale?.asString),
      ("user-scalable", userScalable?.asString),
    ].compactMap { (item: (String, String?)) -> (String, String)? in
      guard let value = item.1 else {
        return nil
      }
      return (item.0, value)
    }.map { "\($0.0)=\($0.1)"}.joined(separator: ", ")

    guard !content.isEmpty else {
      return nil
    }
    return content
  }

  private let width: Dimension?
  private let height: Dimension?
  private let initialScale: Double?
  private let minimumScale: Double?
  private let maximumScale: Double?
  private let userScalable: Bool?
}

extension Double {
  fileprivate var asString: String? {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    return formatter.string(from: self as NSNumber)
  }
}

extension Bool {
  fileprivate var asString: String? {
    if self {
      return "yes"
    } else {
      return "no"
    }
  }
}
