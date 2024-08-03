import Testing

import Slipstream

struct CharsetTests {
  @Test func charsetStringRepresentations() throws {
    try #expect(renderHTML(Charset(.ascii)) == #"<meta charset="US-ASCII" />"#)
    try #expect(renderHTML(Charset(.japaneseEUC)) == #"<meta charset="EUC-JP" />"#)
    try #expect(renderHTML(Charset(.utf8)) == #"<meta charset="UTF-8" />"#)
    try #expect(renderHTML(Charset(.isoLatin1)) == #"<meta charset="csISOLatin1" />"#)
    try #expect(renderHTML(Charset(.nonLossyASCII)) == #"<meta charset="US-ASCII" />"#)
    try #expect(renderHTML(Charset(.shiftJIS)) == #"<meta charset="Shift_JIS" />"#)
    try #expect(renderHTML(Charset(.isoLatin2)) == #"<meta charset="csISOLatin2" />"#)
    try #expect(renderHTML(Charset(.windowsCP1251)) == #"<meta charset="windows-1251" />"#)
    try #expect(renderHTML(Charset(.windowsCP1252)) == #"<meta charset="windows-1252" />"#)
    try #expect(renderHTML(Charset(.windowsCP1253)) == #"<meta charset="windows-1253" />"#)
    try #expect(renderHTML(Charset(.windowsCP1254)) == #"<meta charset="windows-1254" />"#)
    try #expect(renderHTML(Charset(.windowsCP1250)) == #"<meta charset="windows-1250" />"#)
    try #expect(renderHTML(Charset(.iso2022JP)) == #"<meta charset="csISO2022JP" />"#)
    try #expect(renderHTML(Charset(.utf16)) == #"<meta charset="UTF-16" />"#)
    try #expect(renderHTML(Charset(.unicode)) == #"<meta charset="UTF-16" />"#)
    try #expect(renderHTML(Charset(.utf16BigEndian)) == #"<meta charset="UTF-16BE" />"#)
    try #expect(renderHTML(Charset(.utf16LittleEndian)) == #"<meta charset="UTF-16LE" />"#)
    try #expect(renderHTML(Charset(.utf32)) == #"<meta charset="UTF-32" />"#)
    try #expect(renderHTML(Charset(.utf32BigEndian)) == #"<meta charset="UTF-32BE" />"#)
    try #expect(renderHTML(Charset(.utf32LittleEndian)) == #"<meta charset="UTF-32LE" />"#)

    #expect(performing: {
      try #expect(renderHTML(Charset(.nextstep)) == #"<meta charset="nextstep" />"#)
    }, throws: { error in
      guard let charsetError = error as? Charset.EncodingTranslationError,
            case .noIANAEquivalent = charsetError else {
        return false
      }
      return true
    })
    #expect(performing: {
      try #expect(renderHTML(Charset(.symbol)) == #"<meta charset="MacSymbol" />"#)
    }, throws: { error in
      guard let charsetError = error as? Charset.EncodingTranslationError,
            case .noIANAEquivalent = charsetError else {
        return false
      }
      return true
    })
    #expect(performing: {
      try #expect(renderHTML(Charset(.symbol)) == #"<meta charset="MacSymbol" />"#)
    }, throws: { error in
      guard let charsetError = error as? Charset.EncodingTranslationError,
            case .noIANAEquivalent = charsetError else {
        return false
      }
      return true
    })
    #expect(performing: {
      try #expect(renderHTML(Charset(.macOSRoman)) == #"<meta charset="macOSRoman" />"#)
    }, throws: { error in
      guard let charsetError = error as? Charset.EncodingTranslationError,
            case .noIANAEquivalent = charsetError else {
        return false
      }
      return true
    })
  }
}
