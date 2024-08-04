import Foundation

/// Constants that control the repitition of a background image..
///
/// - SeeAlso: Tailwind CSS' [`background repeat`](https://tailwindcss.com/docs/background-repeat) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum BackgroundRepeat: String {
  case yes = "repeat"
  case no = "no-repeat"
  case x = "repeat-x"
  case y = "repeat-y"
  case round = "repeat-round"
  case space = "repeat-space"
}

/// Constants that control the size of a background image..
///
/// - SeeAlso: Tailwind CSS' [`background size`](https://tailwindcss.com/docs/background-size) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct BackgroundSize {
  /// Displays the background image at its default size.
  public static let auto: BackgroundSize = BackgroundSize(storage: .aspectRatio(.auto))

  /// Scales the background image until it fills the background layer.
  public static let cover: BackgroundSize = BackgroundSize(storage: .aspectRatio(.cover))

  /// Scales the background image to the outer edges without cropping or stretching.
  public static let contain: BackgroundSize = BackgroundSize(storage: .aspectRatio(.contain))

  /// Specifies an arbitrary size to use for the background image.
  public static func size(width: Double, height: Double) -> BackgroundSize {
    return BackgroundSize(
      storage: .size(.init(width: width, height: height))
    )
  }

  fileprivate init(storage: Storage) {
    self.storage = storage
  }

  fileprivate enum AspectRatio: String {
    case auto
    case cover
    case contain
  }
  fileprivate enum Storage {
    case aspectRatio(AspectRatio)
    case size(Size)
  }
  fileprivate let storage: Storage

  fileprivate func toTailwindSpacingClass() -> String? {
    switch storage {
    case .aspectRatio(let aspectRatio):
      return "bg-" + aspectRatio.rawValue
    case .size(let size):
      guard let pixels = size.asPixels else {
        return nil
      }
      return "bg-[length:\(pixels)]"
    }
  }
}

extension View {
  /// Changes the background image of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [`background image`](https://tailwindcss.com/docs/background-image) documentation.
  /// - SeeAlso: Tailwind CSS' [`background repeat`](https://tailwindcss.com/docs/background-repeat) documentation.
  /// - SeeAlso: Tailwind CSS' [`background size`](https://tailwindcss.com/docs/background-size) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func backgroundImage(_ url: URL?, size: BackgroundSize? = nil, repeat: BackgroundRepeat? = nil, condition: Condition? = nil) -> some View {
    var classNames: [String] = []
    if let url {
      classNames.append("bg-[url('\(url.path())')]")
    }
    if let size = size?.toTailwindSpacingClass() {
      classNames.append(size)
    }
    if let `repeat` {
      classNames.append("bg-\(`repeat`.rawValue)")
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }
}
