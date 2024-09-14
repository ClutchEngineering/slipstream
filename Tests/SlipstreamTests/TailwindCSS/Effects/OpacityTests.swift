import Testing

import Slipstream

struct OpacityTests {
  @Test func opacities() throws {
    try #expect(renderHTML(Div {}.opacity(0.00)) == #"<div class="opacity-0"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.05)) == #"<div class="opacity-5"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.10)) == #"<div class="opacity-10"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.15)) == #"<div class="opacity-15"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.20)) == #"<div class="opacity-20"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.25)) == #"<div class="opacity-25"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.30)) == #"<div class="opacity-30"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.35)) == #"<div class="opacity-35"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.40)) == #"<div class="opacity-40"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.45)) == #"<div class="opacity-45"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.50)) == #"<div class="opacity-50"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.55)) == #"<div class="opacity-55"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.60)) == #"<div class="opacity-60"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.65)) == #"<div class="opacity-65"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.70)) == #"<div class="opacity-70"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.75)) == #"<div class="opacity-75"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.80)) == #"<div class="opacity-80"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.85)) == #"<div class="opacity-85"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.90)) == #"<div class="opacity-90"></div>"#)
    try #expect(renderHTML(Div {}.opacity(0.95)) == #"<div class="opacity-95"></div>"#)
    try #expect(renderHTML(Div {}.opacity(1.00)) == #"<div class="opacity-100"></div>"#)
  }
}
