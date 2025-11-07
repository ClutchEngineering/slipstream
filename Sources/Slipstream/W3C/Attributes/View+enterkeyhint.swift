extension View {
  /// The enterkeyhint attribute hints at the action label or icon for the enter key
  /// on virtual keyboards.
  public enum EnterKeyHint: String {
    /// The user agent should present a cue for the action 'enter', typically inserting a new line.
    case enter
    /// The user agent should present a cue for the action 'done', typically meaning there is
    /// nothing more to input and the input method editor (IME) will be closed.
    case done
    /// The user agent should present a cue for the action 'go', typically meaning to take the
    /// user to the target of the text they typed.
    case go
    /// The user agent should present a cue for the action 'next', typically taking the user to
    /// the next field that will accept text.
    case next
    /// The user agent should present a cue for the action 'previous', typically taking the user
    /// to the previous field that will accept text.
    case previous
    /// The user agent should present a cue for the action 'search', typically taking the user
    /// to the results of searching for the text they have typed.
    case search
    /// The user agent should present a cue for the action 'send', typically delivering the text
    /// to its target.
    case send
  }

  /// Hints at the action label or icon to present for the enter key on virtual keyboards.
  ///
  /// The enterkeyhint attribute is particularly useful on mobile devices where the virtual
  /// keyboard can display different labels on the enter key based on the expected action.
  ///
  /// ```swift
  /// TextField("Search", type: .search)
  ///   .enterKeyHint(.search)
  /// ```
  ///
  /// - Parameter hint: The hint for the enter key presentation.
  ///
  /// - SeeAlso: W3C [`enterkeyhint`](https://html.spec.whatwg.org/multipage/interaction.html#attr-enterkeyhint) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func enterKeyHint(_ hint: EnterKeyHint) -> some View {
    return modifier(AttributeModifier(.enterkeyhint, value: hint.rawValue))
  }
}
