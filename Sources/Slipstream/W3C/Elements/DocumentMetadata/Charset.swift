import Foundation

import SwiftSoup

/// A view that defines the document's character-encoding.
///
/// There must not be more than one ``Charset`` view per document.
///
/// Character encoding is a critical aspect of web development because it defines
/// how text data is represented in the document. Setting the right charset
/// ensures that characters are correctly displayed in the browser, regardless of
/// the user's language or regional settings. This is especially important for
/// documents containing non-ASCII characters, such as accented letters,
/// symbols, or characters from non-Latin alphabets.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       Charset(.utf8)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`meta charset`](https://html.spec.whatwg.org/multipage/semantics.html#charset) specification.
/// - SeeAlso: IANA [character sets](https://www.iana.org/assignments/character-sets/character-sets.xhtml).
@available(iOS 17.0, macOS 14.0, *)
public struct Charset: View {
  /// Creates a Charset view.
  public init(_ encoding: String.Encoding) {
    self.encoding = encoding
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("meta")
    try element.attr("charset", encodingMIMEName())
  }

  private let encoding: String.Encoding

  private func encodingMIMEName() throws -> String {
    switch encoding {
    case .ascii: return "US-ASCII"
    case .nextstep: throw EncodingTranslationError.noIANAEquivalent(encoding)
    case .japaneseEUC: return "EUC-JP"
    case .utf8: return "UTF-8"
    case .isoLatin1: return "csISOLatin1"
    case .symbol: throw EncodingTranslationError.noIANAEquivalent(encoding)
    case .nonLossyASCII: return "US-ASCII"
    case .shiftJIS: return "Shift_JIS"
    case .isoLatin2: return "csISOLatin2"
    case .windowsCP1251: return "windows-1251"
    case .windowsCP1252: return "windows-1252"
    case .windowsCP1253: return "windows-1253"
    case .windowsCP1254: return "windows-1254"
    case .windowsCP1250: return "windows-1250"
    case .iso2022JP: return "csISO2022JP"
    case .macOSRoman: throw EncodingTranslationError.noIANAEquivalent(encoding)
    case .utf16: return "UTF-16"
    case .utf16BigEndian: return "UTF-16BE"
    case .utf16LittleEndian: return "UTF-16LE"
    case .utf32: return "UTF-32"
    case .utf32BigEndian: return "UTF-32BE"
    case .utf32LittleEndian: return "UTF-32LE"
    default: throw EncodingTranslationError.noIANAEquivalent(encoding)
    }
  }
}

extension Charset {
  /// Errors that are thrown when the Charset view fails to render.
  public enum EncodingTranslationError: Error, LocalizedError {
    /// There is no IANA equivalent of the provided string encoding.
    case noIANAEquivalent(String.Encoding)

    /// Returns a human-readable representation of this error.
    public var errorDescription: String? {
      switch self {
      case .noIANAEquivalent(let encoding):
        return String("There is no IANA equivalent for \(encoding)")
      }
    }
  }
}
