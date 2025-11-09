# Slipstream for web developers

An exhaustive comparison of Slipstream features to equivalent HTML features.

Slipstream aims to provide an implementation of every element and attribute type supported by the
[HTML specification](https://html.spec.whatwg.org/multipage/). The remaining work is being tracked
by the following issues on GitHub:

- [Implement the full suite of W3C tags](https://github.com/jverkoey/slipstream/issues/25)
- [Implement the full suite of W3C global attributes](https://github.com/jverkoey/slipstream/issues/27)

## The elements of Slipstream

Modeling after [the W3C specification](https://html.spec.whatwg.org/multipage/semantics.html#semantics),
provided below is an organized table of W3C HTML tags and their equivalent Slipstream views.

### The document element

 W3C tag | Slipstream view
:--------|:----------------
[`<html>`](https://html.spec.whatwg.org/multipage/semantics.html#the-html-element) | ``HTML``

### Document metadata

 W3C tag | Slipstream view
:--------|:----------------
[`<head>`](https://html.spec.whatwg.org/multipage/semantics.html#the-head-element) | ``Head``
[`<title>`](https://html.spec.whatwg.org/multipage/semantics.html#the-title-element) | ``Title``
[`<base>`](https://html.spec.whatwg.org/multipage/semantics.html#the-base-element) | ``Base``
[`<link rel="alternate">`](https://html.spec.whatwg.org/multipage/links.html#rel-alternate) | ``Alternate``
[`<link rel="author">`](https://html.spec.whatwg.org/multipage/links.html#link-type-author) | ``Author``
[`<link rel="bookmark">`](https://html.spec.whatwg.org/multipage/links.html#link-type-bookmark) | ``Bookmark``
[`<link rel="canonical">`](https://html.spec.whatwg.org/multipage/links.html#link-type-canonical) | ``Canonical``
[`<link rel="dns-prefetch">`](https://html.spec.whatwg.org/multipage/links.html#link-type-dns-prefetch) | ``DNSPrefetch``
[`<link rel="expect">`](https://html.spec.whatwg.org/multipage/links.html#link-type-expect) | ``Expect``
[`<link rel="external">`](https://html.spec.whatwg.org/multipage/links.html#link-type-external) | ``External``
[`<link rel="help">`](https://html.spec.whatwg.org/multipage/links.html#link-type-help) | ``Help``
[`<link rel="icon">`](https://html.spec.whatwg.org/multipage/links.html#rel-icon) | ``Icon``
[`<link rel="license">`](https://html.spec.whatwg.org/multipage/links.html#link-type-license) | ``License``
[`<link rel="manifest">`](https://html.spec.whatwg.org/multipage/links.html#link-type-manifest) | ``Manifest``
[`<link rel="modulepreload">`](https://html.spec.whatwg.org/multipage/links.html#link-type-modulepreload) | ``ModulePreload``
[`<link rel="next">`](https://html.spec.whatwg.org/multipage/links.html#link-type-next) | ``Next``
[`<link rel="nofollow">`](https://html.spec.whatwg.org/multipage/links.html#link-type-nofollow) | ``Nofollow``
[`<link rel="noopener">`](https://html.spec.whatwg.org/multipage/links.html#link-type-noopener) | ``NoOpener``
[`<link rel="noreferrer">`](https://html.spec.whatwg.org/multipage/links.html#link-type-noreferrer) | ``NoReferrer``
[`<link rel="opener">`](https://html.spec.whatwg.org/multipage/links.html#link-type-opener) | ``Opener``
[`<link rel="pingback">`](https://html.spec.whatwg.org/multipage/links.html#link-type-pingback) | ``Pingback``
[`<link rel="preconnect">`](https://html.spec.whatwg.org/multipage/links.html#link-type-preconnect) | ``Preconnect``
[`<link rel="prefetch">`](https://html.spec.whatwg.org/multipage/links.html#link-type-prefetch) | ``Prefetch``
[`<link rel="preload">`](https://html.spec.whatwg.org/multipage/links.html#link-type-preload) | ``Preload``
[`<link rel="prev">`](https://html.spec.whatwg.org/multipage/links.html#link-type-prev) | ``Previous``
[`<link rel="privacy-policy">`](https://html.spec.whatwg.org/multipage/links.html#link-type-privacy-policy) | ``PrivacyPolicy``
[`<link rel="search">`](https://html.spec.whatwg.org/multipage/links.html#link-type-search) | ``SearchLink``
[`<link rel="stylesheet">`](https://html.spec.whatwg.org/multipage/links.html#link-type-stylesheet) | ``Stylesheet``
[`<link rel="tag">`](https://html.spec.whatwg.org/multipage/links.html#link-type-tag) | ``Tag``
[`<link rel="terms-of-service">`](https://html.spec.whatwg.org/multipage/links.html#link-type-terms-of-service) | ``TermsOfService`` 
[`<meta>`](https://html.spec.whatwg.org/multipage/semantics.html#the-meta-element) | ``Meta``
[`<meta http-equiv="refresh">`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-http-equiv-refresh) | ``Redirect``
[`<meta charset="">`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-charset) | ``Charset``
[`<meta name="viewport">`](https://drafts.csswg.org/css-viewport) | ``Viewport``
[`<style="">`](https://html.spec.whatwg.org/multipage/semantics.html#the-style-element) | ``Stylesheet`` 

### Sections

 W3C tag | Slipstream view
:--------|:----------------
[`<body>`](https://html.spec.whatwg.org/multipage/sections.html#the-body-element) | ``Body``
[`<article>`](https://html.spec.whatwg.org/multipage/sections.html#the-article-element) | ``Article``
[`<section>`](https://html.spec.whatwg.org/multipage/sections.html#the-section-element) | ``Section``
[`<nav>`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) | ``Navigation``
[`<aside>`](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element) | ``Aside``
[`<h1>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H1`` or ``Heading``
[`<h2>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H2`` or ``Heading``
[`<h3>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H3`` or ``Heading``
[`<h4>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H4`` or ``Heading``
[`<h5>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H5`` or ``Heading``
[`<h6>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H6`` or ``Heading``
[`<hgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-hgroup-element) | ``HGroup``
[`<header>`](https://html.spec.whatwg.org/multipage/sections.html#the-header-element) | ``Header``
[`<footer>`](https://html.spec.whatwg.org/multipage/sections.html#the-footer-element) | ``Footer``
[`<address>`](https://html.spec.whatwg.org/multipage/sections.html#the-address-element) | ``Address``

### Grouping content

 W3C tag | Slipstream view
:--------|:----------------
[`<p>`](https://html.spec.whatwg.org/multipage/sections.html#the-p-element) | ``Paragraph`` 
[`<hr>`](https://html.spec.whatwg.org/multipage/sections.html#the-hr-element) | ``Divider`` 
[`<pre>`](https://html.spec.whatwg.org/multipage/sections.html#the-pre-element) | ``Preformatted`` 
[`<blockquote>`](https://html.spec.whatwg.org/multipage/sections.html#the-blockquote-element) | ``Blockquote`` 
[`<ol>`](https://html.spec.whatwg.org/multipage/sections.html#the-ol-element) | ``List`` 
[`<ul>`](https://html.spec.whatwg.org/multipage/sections.html#the-ul-element) | ``List`` 
[`<menu>`](https://html.spec.whatwg.org/multipage/sections.html#the-menu-element) | ``Menu`` 
[`<li>`](https://html.spec.whatwg.org/multipage/sections.html#the-li-element) | ``ListItem`` 
[`<dl>`](https://html.spec.whatwg.org/multipage/sections.html#the-dl-element) | ``DescriptionList``
[`<dt>`](https://html.spec.whatwg.org/multipage/sections.html#the-dt-element) | ``DescriptionTerm``
[`<dd>`](https://html.spec.whatwg.org/multipage/sections.html#the-dd-element) | ``DefinitionDescription``
[`<figure>`](https://html.spec.whatwg.org/multipage/sections.html#the-figure-element) | ``Figure``
[`<figcaption>`](https://html.spec.whatwg.org/multipage/sections.html#the-figcaption-element) | ``FigureCaption`` 
[`<main>`](https://html.spec.whatwg.org/multipage/sections.html#the-main-element) | ``DocumentMain`` 
[`<search>`](https://html.spec.whatwg.org/multipage/sections.html#the-search-element) | ``Search`` 
[`<div>`](https://html.spec.whatwg.org/multipage/sections.html#the-div-element) | ``Div`` 

### Text-level semantics

 W3C tag | Slipstream view
:--------|:----------------
[`<a>`](https://html.spec.whatwg.org/multipage/sections.html#the-a-element) | ``Link`` 
[`<em>`](https://html.spec.whatwg.org/multipage/sections.html#the-em-element) | ``Emphasis`` 
[`<strong>`](https://html.spec.whatwg.org/multipage/sections.html#the-strong-element) | ``Strong`` 
[`<small>`](https://html.spec.whatwg.org/multipage/sections.html#the-small-element) | ``Small`` 
[`<s>`](https://html.spec.whatwg.org/multipage/sections.html#the-s-element) | ``Strikethrough`` 
[`<cite>`](https://html.spec.whatwg.org/multipage/sections.html#the-cite-element) | ``Cite`` 
[`<q>`](https://html.spec.whatwg.org/multipage/sections.html#the-q-element) | ``Quote`` 
[`<dfn>`](https://html.spec.whatwg.org/multipage/sections.html#the-dfn-element) | ``Definition`` 
[`<abbr>`](https://html.spec.whatwg.org/multipage/sections.html#the-abbr-element) | ``Abbreviation`` 
[`<ruby>`](https://html.spec.whatwg.org/multipage/sections.html#the-ruby-element) | ``Ruby`` 
[`<rt>`](https://html.spec.whatwg.org/multipage/sections.html#the-rt-element) | ``RubyText`` 
[`<rp>`](https://html.spec.whatwg.org/multipage/sections.html#the-rp-element) | ``RubyParenthesis`` 
[`<data>`](https://html.spec.whatwg.org/multipage/sections.html#the-data-element) | ``Data`` 
[`<time>`](https://html.spec.whatwg.org/multipage/sections.html#the-time-element) | ``Time`` 
[`<code>`](https://html.spec.whatwg.org/multipage/sections.html#the-code-element) | ``Code`` 
[`<var>`](https://html.spec.whatwg.org/multipage/sections.html#the-var-element) | ``Variable`` 
[`<samp>`](https://html.spec.whatwg.org/multipage/sections.html#the-samp-element) | ``SampleOutput`` 
[`<kbd>`](https://html.spec.whatwg.org/multipage/sections.html#the-kbd-element) | ``Keyboard`` 
[`<sub>`](https://html.spec.whatwg.org/multipage/sections.html#the-sub-element) | ``Subscript``
[`<sup>`](https://html.spec.whatwg.org/multipage/sections.html#the-sup-element) | ``Superscript``
[`<i>`](https://html.spec.whatwg.org/multipage/sections.html#the-i-element) | ``Italic`` 
[`<b>`](https://html.spec.whatwg.org/multipage/sections.html#the-b-element) | ``Bold`` 
[`<u>`](https://html.spec.whatwg.org/multipage/sections.html#the-u-element) | ``Underline`` 
[`<mark>`](https://html.spec.whatwg.org/multipage/sections.html#the-mark-element) | ``Mark`` 
[`<bdi>`](https://html.spec.whatwg.org/multipage/sections.html#the-bdi-element) | ``BidirectionalIsolate`` 
[`<bdo>`](https://html.spec.whatwg.org/multipage/sections.html#the-bdo-element) | ``BidirectionalOverride`` 
[`<span>`](https://html.spec.whatwg.org/multipage/sections.html#the-span-element) | ``Span`` 
[`<br>`](https://html.spec.whatwg.org/multipage/sections.html#the-br-element) | ``Linebreak`` 
[`<wbr>`](https://html.spec.whatwg.org/multipage/sections.html#the-wbr-element) | ``WordBreakOpportunity``

### Edits

 W3C tag | Slipstream view
:--------|:----------------
[`<ins>`](https://html.spec.whatwg.org/multipage/edits.html#the-ins-element) | ``Ins``
[`<del>`](https://html.spec.whatwg.org/multipage/edits.html#the-del-element) | ``Del``

### Embedded content

 W3C tag | Slipstream view
:--------|:----------------
[`<picture>`](https://html.spec.whatwg.org/multipage/sections.html#the-picture-element) | ``Picture``
[`<source>`](https://html.spec.whatwg.org/multipage/sections.html#the-source-element) | ``Source``
[`<img>`](https://html.spec.whatwg.org/multipage/sections.html#the-img-element) | ``Image``
[`<iframe>`](https://html.spec.whatwg.org/multipage/sections.html#the-iframe-element) | ``IFrame``
[`<embed>`](https://html.spec.whatwg.org/multipage/sections.html#the-embed-element) | ``Embed``
[`<object>`](https://html.spec.whatwg.org/multipage/sections.html#the-object-element) | ``Object``
[`<video>`](https://html.spec.whatwg.org/multipage/sections.html#the-video-element) | ``Video``
[`<audio>`](https://html.spec.whatwg.org/multipage/sections.html#the-audio-element) | ``Audio``
[`<track>`](https://html.spec.whatwg.org/multipage/sections.html#the-track-element) | ``Track``
[`<map>`](https://html.spec.whatwg.org/multipage/sections.html#the-map-element) | ``Map``
[`<area>`](https://html.spec.whatwg.org/multipage/sections.html#the-area-element) | ``Area``

### Tabular data

 W3C tag | Slipstream view
:--------|:----------------
[`<table>`](https://html.spec.whatwg.org/multipage/sections.html#the-table-element) | ``Table``
[`<caption>`](https://html.spec.whatwg.org/multipage/sections.html#the-caption-element) | ``Caption``
[`<colgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-colgroup-element) | ``ColumnGroup``
[`<col>`](https://html.spec.whatwg.org/multipage/sections.html#the-col-element) | ``Column``
[`<tbody>`](https://html.spec.whatwg.org/multipage/sections.html#the-tbody-element) | ``TableBody``
[`<thead>`](https://html.spec.whatwg.org/multipage/sections.html#the-thead-element) | ``TableHeader``
[`<tfoot>`](https://html.spec.whatwg.org/multipage/sections.html#the-tfoot-element) | ``TableFooter``
[`<tr>`](https://html.spec.whatwg.org/multipage/sections.html#the-tr-element) | ``TableRow``
[`<td>`](https://html.spec.whatwg.org/multipage/sections.html#the-td-element) | ``TableCell``
[`<th>`](https://html.spec.whatwg.org/multipage/sections.html#the-th-element) | ``TableHeaderCell``

### Forms

 W3C tag | Slipstream view
:--------|:----------------
[`<form>`](https://html.spec.whatwg.org/multipage/sections.html#the-form-element) | ``Form``
[`<label>`](https://html.spec.whatwg.org/multipage/sections.html#the-label-element) | ``Label``
[`<input type="text">`](https://html.spec.whatwg.org/multipage/input.html#text-(type=text)-state-and-search-state-(type=search)) | ``TextField``
[`<input type="search">`](https://html.spec.whatwg.org/multipage/input.html#text-(type=text)-state-and-search-state-(type=search)) | ``TextField``
[`<input type="tel">`](https://html.spec.whatwg.org/multipage/input.html#telephone-state-(type=tel)) | ``TextField``
[`<input type="url">`](https://html.spec.whatwg.org/multipage/input.html#url-state-(type=url)) | ``TextField``
[`<input type="email">`](https://html.spec.whatwg.org/multipage/input.html#email-state-(type=email)) | ``TextField``
[`<input type="password">`](https://html.spec.whatwg.org/multipage/input.html#password-state-(type=password)) | ``TextField``
[`<input type="date">`](https://html.spec.whatwg.org/multipage/input.html#date-state-(type=date)) | ``TextField``
[`<input type="month">`](https://html.spec.whatwg.org/multipage/input.html#month-state-(type=month)) | ``TextField``
[`<input type="week">`](https://html.spec.whatwg.org/multipage/input.html#week-state-(type=week)) | ``TextField``
[`<input type="time">`](https://html.spec.whatwg.org/multipage/input.html#time-state-(type=time)) | ``TextField``
[`<input type="datetime-local">`](https://html.spec.whatwg.org/multipage/input.html#local-date-and-time-state-(type=datetime-local)) | ``TextField``
[`<input type="number">`](https://html.spec.whatwg.org/multipage/input.html#number-state-(type=number)) | ``TextField``
[`<input type="checkbox">`](https://html.spec.whatwg.org/multipage/input.html#checkbox-state-(type=checkbox)) | ``Checkbox``
[`<input type="radio">`](https://html.spec.whatwg.org/multipage/input.html#radio-button-state-(type=radio)) | ``RadioButton``
[`<input type="color">`](https://html.spec.whatwg.org/multipage/input.html#color-state-(type=color)) | ``ColorPicker``
[`<input type="range">`](https://html.spec.whatwg.org/multipage/input.html#range-state-(type=range)) | ``Slider``
[`<input type="file">`](https://html.spec.whatwg.org/multipage/input.html#file-upload-state-(type=file)) | ``FileInput``
[`<input type="hidden">`](https://html.spec.whatwg.org/multipage/input.html#hidden-state-(type=hidden)) | ``HiddenField``
[`<input type="submit">`](https://html.spec.whatwg.org/multipage/input.html#submit-button-state-(type=submit)) | ``SubmitButton``
[`<input type="image">`](https://html.spec.whatwg.org/multipage/input.html#image-button-state-(type=image)) | ``ImageButton``
[`<input type="reset">`](https://html.spec.whatwg.org/multipage/input.html#reset-button-state-(type=reset)) | ``ResetButton``
[`<input type="button">`](https://html.spec.whatwg.org/multipage/input.html#button-state-(type=button)) | ``InputButton``
[`<button>`](https://html.spec.whatwg.org/multipage/sections.html#the-button-element) | ``Button``
[`<select>`](https://html.spec.whatwg.org/multipage/sections.html#the-select-element) | ``Picker``
[`<datalist>`](https://html.spec.whatwg.org/multipage/sections.html#the-datalist-element) | ``DataList``
[`<optgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-optgroup-element) | ``OptGroup``
[`<option>`](https://html.spec.whatwg.org/multipage/sections.html#the-option-element) | ``Option``
[`<textarea>`](https://html.spec.whatwg.org/multipage/sections.html#the-textarea-element) | ``TextArea``
[`<output>`](https://html.spec.whatwg.org/multipage/sections.html#the-output-element) | ``Output``
[`<progress>`](https://html.spec.whatwg.org/multipage/sections.html#the-progress-element) | ``ProgressView``
[`<meter>`](https://html.spec.whatwg.org/multipage/sections.html#the-meter-element) | ``Meter``
[`<fieldset>`](https://html.spec.whatwg.org/multipage/sections.html#the-fieldset-element) | ``Fieldset``
[`<legend>`](https://html.spec.whatwg.org/multipage/sections.html#the-legend-element) | ``Legend``

### Interactive elements

 W3C tag | Slipstream view
:--------|:----------------
[`<details>`](https://html.spec.whatwg.org/multipage/sections.html#the-details-element) | ``Details``
[`<summary>`](https://html.spec.whatwg.org/multipage/sections.html#the-summary-element) | ``Summary``
[`<dialog>`](https://html.spec.whatwg.org/multipage/sections.html#the-dialog-element) | ``Dialog``

### Scripting

 W3C tag | Slipstream view
:--------|:----------------
[`<script>`](https://html.spec.whatwg.org/multipage/sections.html#the-script-element) | ``Script``
[`<noscript>`](https://html.spec.whatwg.org/multipage/sections.html#the-noscript-element) | ``Noscript``
[`<template>`](https://html.spec.whatwg.org/multipage/sections.html#the-template-element) | ``Template``
[`<slot>`](https://html.spec.whatwg.org/multipage/sections.html#the-slot-element) | ``Slot``
[`<canvas>`](https://html.spec.whatwg.org/multipage/sections.html#the-canvas-element) | ``Canvas``

### SVG (Scalable Vector Graphics)

 W3C tag | Slipstream view
:--------|:----------------
[`<svg>`](https://svgwg.org/svg2-draft/struct.html#SVGElement) | ``SVG``
[`<circle>`](https://svgwg.org/svg2-draft/shapes.html#CircleElement) | ``SVGCircle``
[`<defs>`](https://svgwg.org/svg2-draft/struct.html#DefsElement) | ``SVGDefs``
[`<desc>`](https://svgwg.org/svg2-draft/struct.html#DescElement) | ``SVGDesc``
[`<g>`](https://svgwg.org/svg2-draft/struct.html#GElement) | ``SVGGroup``
[`<linearGradient>`](https://svgwg.org/svg2-draft/pservers.html#LinearGradientElement) | ``SVGLinearGradient``
[`<path>`](https://svgwg.org/svg2-draft/paths.html#PathElement) | ``SVGPath``
[`<radialGradient>`](https://svgwg.org/svg2-draft/pservers.html#RadialGradientElement) | ``SVGRadialGradient``
[`<rect>`](https://svgwg.org/svg2-draft/shapes.html#RectElement) | ``SVGRect``
[`<stop>`](https://svgwg.org/svg2-draft/pservers.html#StopElement) | ``SVGStop``
[`<text>`](https://svgwg.org/svg2-draft/text.html#TextElement) | ``SVGText``
[`<title>`](https://svgwg.org/svg2-draft/struct.html#TitleElement) | ``SVGTitle``

### MathML (Mathematical Markup Language)

 W3C tag | Slipstream view
:--------|:----------------
[`<math>`](https://www.w3.org/TR/MathML3/chapter2.html#interf.toplevel) | ``Math``
[`<mi>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mi) | ``MI``
[`<mo>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mo) | ``MO``
[`<mn>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mn) | ``MN``
[`<mtext>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtext) | ``MText``
[`<ms>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.ms) | ``MS``
[`<mrow>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mrow) | ``MRow``
[`<mfrac>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mfrac) | ``MFrac``
[`<msup>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.msup) | ``MSup``
[`<msub>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.msub) | ``MSub``
[`<msubsup>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.msubsup) | ``MSubSup``
[`<msqrt>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.msqrt) | ``MSqrt``
[`<mroot>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mroot) | ``MRoot``
[`<munder>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.munder) | ``MUnder``
[`<mover>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mover) | ``MOver``
[`<munderover>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.munderover) | ``MUnderOver``
[`<mtable>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtable) | ``MTable``
[`<mtr>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtr) | ``MTr``
[`<mtd>`](https://www.w3.org/TR/MathML3/chapter3.html#presm.mtd) | ``MTd``

## The global attributes of Slipstream

Modeling after [the W3C specification](https://html.spec.whatwg.org/multipage/dom.html#global-attributes),
provided below is an organized table of W3C global HTML attributes and their equivalent Slipstream view modifiers.

### Global attributes

W3C attribute | Slipstream modifier | Notes
:-------------|:-------------------|:------
[`accesskey`](https://html.spec.whatwg.org/multipage/interaction.html#the-accesskey-attribute) | ``keyboardShortcut(_:)`` | Specifies a keyboard shortcut to activate or focus the element
[`autocapitalize`](https://html.spec.whatwg.org/multipage/interaction.html#attr-autocapitalize) | ``autocapitalize(_:)`` | Controls whether and how text input is automatically capitalized
[`autofocus`](https://html.spec.whatwg.org/multipage/interaction.html#attr-fe-autofocus) | ``autofocus(_:)`` | Indicates that the element should be focused on page load
`class` | ``className(_:)`` | Adds classes to the element. Use TailwindCSS modifiers for styling
[`contenteditable`](https://html.spec.whatwg.org/multipage/interaction.html#attr-contenteditable) | ``contenteditable(_:)`` | Indicates whether the element's content is editable
[`data-*`](https://html.spec.whatwg.org/multipage/dom.html#embedding-custom-non-visible-data-with-the-data-*-attributes) | ``data(_:)`` | Sets custom data attributes on the view
[`dir`](https://html.spec.whatwg.org/multipage/dom.html#attr-dir) | ``direction(_:)`` | Specifies the element's text directionality
[`draggable`](https://html.spec.whatwg.org/multipage/dnd.html#attr-draggable) | ``draggable(_:)`` | Indicates whether the element can be dragged
[`enterkeyhint`](https://html.spec.whatwg.org/multipage/interaction.html#attr-enterkeyhint) | ``submitLabel(_:)`` | Hints at the action label for the enter key on virtual keyboards
[`hidden`](https://html.spec.whatwg.org/multipage/interaction.html#attr-hidden) | ``hidden(_:)`` | Sets the HTML hidden attribute (different from TailwindCSS hidden())
`id` | ``id(_:)`` | Sets the element's unique identifier
[`inert`](https://html.spec.whatwg.org/multipage/interaction.html#the-inert-attribute) | ``allowsHitTesting(_:)`` | Controls whether the element can receive user interaction (inverted logic)
[`inputmode`](https://html.spec.whatwg.org/multipage/interaction.html#attr-inputmode) | ``keyboardType(_:)`` | Sets the keyboard type for text input
[`is`](https://html.spec.whatwg.org/multipage/custom-elements.html#attr-is) | ``customElement(_:)`` | Specifies the name of a custom element
[`itemid`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemid) | ``itemID(_:)`` | The globally unique identifier of a microdata item
[`itemprop`](https://html.spec.whatwg.org/multipage/microdata.html#names:-the-itemprop-attribute) | ``itemProp(_:)`` | Used to add properties to a microdata item
[`itemref`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemref) | ``itemRef(_:)`` | Associates non-descendant properties with a microdata item
[`itemscope`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemscope) | ``itemScope(_:)`` | Creates a new microdata item
[`itemtype`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemtype) | ``itemType(_:)`` | Specifies the vocabulary URL for a microdata item
[`lang`](https://html.spec.whatwg.org/multipage/dom.html#attr-lang) | ``language(_:)`` | Sets the primary language for the view's contents
[`nonce`](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#attr-nonce) | ``nonce(_:)`` | A cryptographic nonce used by Content Security Policy
[`popover`](https://html.spec.whatwg.org/multipage/popover.html#attr-popover) | ``popover(_:)`` | Indicates that the element is a popover element
[`referrerpolicy`](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#referrer-policy-attribute) | ``referrerPolicy(_:)`` | Controls how much referrer information should be included with requests
`slot` | ``slot(_:)`` | Assigns a slot in a shadow DOM shadow tree
[`spellcheck`](https://html.spec.whatwg.org/multipage/interaction.html#attr-spellcheck) | ``spellcheck(_:)`` | Specifies whether the element may be checked for spelling errors
[`style`](https://html.spec.whatwg.org/multipage/dom.html#attr-style) | ``inlineStyle(_:)`` | Contains CSS styling declarations. Prefer TailwindCSS modifiers when possible
[`tabindex`](https://html.spec.whatwg.org/multipage/interaction.html#attr-tabindex) | ``tabIndex(_:)`` or ``focusable()`` | Controls focus and keyboard navigation
[`title`](https://html.spec.whatwg.org/multipage/dom.html#attr-title) | ``tooltip(_:)`` | Advisory information, typically shown as a tooltip
[`translate`](https://html.spec.whatwg.org/multipage/dom.html#attr-translate) | ``translatable(_:)`` | Specifies whether content should be translated
[`writingsuggestions`](https://html.spec.whatwg.org/multipage/interaction.html#attr-writingsuggestions) | ``writingSuggestions(_:)`` | Controls whether browser-provided writing suggestions should be offered

## Tailwind CSS modifiers

Slipstream provides Swift-based Tailwind CSS modifiers for styling. Below is a reference of key
CSS properties and their Slipstream equivalents.

### Layout

CSS property | Slipstream modifier | Notes
:------------|:-------------------|:------
[`visibility`](https://tailwindcss.com/docs/visibility) | ``visibility(_:)`` | Controls the visibility of an element (visible, invisible, collapse)
[`z-index`](https://tailwindcss.com/docs/z-index) | ``zIndex(_:)`` | Controls the vertical stacking order of elements
