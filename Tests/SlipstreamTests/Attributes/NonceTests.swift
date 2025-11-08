import Testing

import Slipstream

struct NonceTests {
  @Test func withNonce() throws {
    try #expect(renderHTML(Script("console.log('test');").nonce("abc123")) == #"<script nonce="abc123">console.log('test');</script>"#)
  }

  @Test func onDiv() throws {
    try #expect(renderHTML(Div {}.nonce("abc123")) == #"<div nonce="abc123"></div>"#)
  }
}
