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
[`<base>`](https://html.spec.whatwg.org/multipage/semantics.html#the-base-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<link rel="alternate">`](https://html.spec.whatwg.org/multipage/links.html#rel-alternate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<link rel="alternate">`](https://html.spec.whatwg.org/multipage/links.html#rel-alternate) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="canonical">`](https://html.spec.whatwg.org/multipage/links.html#link-type-canonical) | ``Canonical`` 
[`<link rel="author">`](https://html.spec.whatwg.org/multipage/links.html#link-type-author) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="bookmark">`](https://html.spec.whatwg.org/multipage/links.html#link-type-bookmark) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="dns-prefetch">`](https://html.spec.whatwg.org/multipage/links.html#link-type-dns-prefetch) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="expect">`](https://html.spec.whatwg.org/multipage/links.html#link-type-expect) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="external">`](https://html.spec.whatwg.org/multipage/links.html#link-type-external) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="help">`](https://html.spec.whatwg.org/multipage/links.html#link-type-help) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)   
[`<link rel="icon">`](https://html.spec.whatwg.org/multipage/links.html#rel-icon) | ``Icon``   
[`<link rel="manifest">`](https://html.spec.whatwg.org/multipage/links.html#link-type-manifest) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="modulepreload">`](https://html.spec.whatwg.org/multipage/links.html#link-type-modulepreload) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="license">`](https://html.spec.whatwg.org/multipage/links.html#link-type-license) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="next">`](https://html.spec.whatwg.org/multipage/links.html#link-type-next) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="nofollow">`](https://html.spec.whatwg.org/multipage/links.html#link-type-nofollow) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="noopener">`](https://html.spec.whatwg.org/multipage/links.html#link-type-noopener) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="noreferrer">`](https://html.spec.whatwg.org/multipage/links.html#link-type-noreferrer) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="opener">`](https://html.spec.whatwg.org/multipage/links.html#link-type-opener) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="pingback">`](https://html.spec.whatwg.org/multipage/links.html#link-type-pingback) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)   
[`<link rel="preconnect">`](https://html.spec.whatwg.org/multipage/links.html#link-type-preconnect) | ``Preconnect`` 
[`<link rel="prefetch">`](https://html.spec.whatwg.org/multipage/links.html#link-type-prefetch) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="preload">`](https://html.spec.whatwg.org/multipage/links.html#link-type-preload) | ``Preload`` 
[`<link rel="prev">`](https://html.spec.whatwg.org/multipage/links.html#link-type-prev) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="privacy">`-policy](https://html.spec.whatwg.org/multipage/links.html#link-type-privacy-policy) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="search">`](https://html.spec.whatwg.org/multipage/links.html#link-type-search) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="stylesheet">`](https://html.spec.whatwg.org/multipage/links.html#link-type-stylesheet) | ``Stylesheet`` 
[`<link rel="tag">`](https://html.spec.whatwg.org/multipage/links.html#link-type-tag) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<link rel="terms-of-service">`](https://html.spec.whatwg.org/multipage/links.html#link-type-terms-of-service) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<meta>`](https://html.spec.whatwg.org/multipage/semantics.html#the-meta-element) | ``Meta``
[`<meta http-equiv="refresh">`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-http-equiv-refresh) | ``Redirect``
[`<meta charset="">`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-charset) | ``Charset`` 
[`<style="">`](https://html.spec.whatwg.org/multipage/semantics.html#the-style-element) | ``Stylesheet`` 

### Sections

 W3C tag | Slipstream view
:--------|:----------------
[`<body>`](https://html.spec.whatwg.org/multipage/sections.html#the-body-element) | ``Body``
[`<article>`](https://html.spec.whatwg.org/multipage/sections.html#the-article-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<section>`](https://html.spec.whatwg.org/multipage/sections.html#the-section-element) | ``Section``
[`<nav>`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) | ``Navigation``
[`<aside>`](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<h1>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H1`` or ``Heading``
[`<h2>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H2`` or ``Heading``
[`<h3>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H3`` or ``Heading``
[`<h4>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H4`` or ``Heading``
[`<h5>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H5`` or ``Heading``
[`<h6>`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) | ``H6`` or ``Heading``
[`<hgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-hgroup-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<header>`](https://html.spec.whatwg.org/multipage/sections.html#the-header-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
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
[`<menu>`](https://html.spec.whatwg.org/multipage/sections.html#the-menu-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<li>`](https://html.spec.whatwg.org/multipage/sections.html#the-li-element) | ``ListItem`` 
[`<dl>`](https://html.spec.whatwg.org/multipage/sections.html#the-dl-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<dt>`](https://html.spec.whatwg.org/multipage/sections.html#the-dt-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<dd>`](https://html.spec.whatwg.org/multipage/sections.html#the-dd-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<figure>`](https://html.spec.whatwg.org/multipage/sections.html#the-figure-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<figcaption>`](https://html.spec.whatwg.org/multipage/sections.html#the-figcaption-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<main>`](https://html.spec.whatwg.org/multipage/sections.html#the-main-element) | ``DocumentMain`` 
[`<search>`](https://html.spec.whatwg.org/multipage/sections.html#the-search-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<div>`](https://html.spec.whatwg.org/multipage/sections.html#the-div-element) | ``Div`` 

### Text-level semantics

 W3C tag | Slipstream view
:--------|:----------------
[`<a>`](https://html.spec.whatwg.org/multipage/sections.html#the-a-element) | ``Link`` 
[`<em>`](https://html.spec.whatwg.org/multipage/sections.html#the-em-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<strong>`](https://html.spec.whatwg.org/multipage/sections.html#the-strong-element) | ``Strong`` 
[`<small>`](https://html.spec.whatwg.org/multipage/sections.html#the-small-element) | ``Small`` 
[`<s>`](https://html.spec.whatwg.org/multipage/sections.html#the-s-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<cite>`](https://html.spec.whatwg.org/multipage/sections.html#the-cite-element) | ``Cite`` 
[`<q>`](https://html.spec.whatwg.org/multipage/sections.html#the-q-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<dfn>`](https://html.spec.whatwg.org/multipage/sections.html#the-dfn-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<abbr>`](https://html.spec.whatwg.org/multipage/sections.html#the-abbr-element) | ``Abbreviation`` 
[`<ruby>`](https://html.spec.whatwg.org/multipage/sections.html#the-ruby-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<rt>`](https://html.spec.whatwg.org/multipage/sections.html#the-rt-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<rp>`](https://html.spec.whatwg.org/multipage/sections.html#the-rp-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<data>`](https://html.spec.whatwg.org/multipage/sections.html#the-data-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<time>`](https://html.spec.whatwg.org/multipage/sections.html#the-time-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<code>`](https://html.spec.whatwg.org/multipage/sections.html#the-code-element) | ``Code`` 
[`<var>`](https://html.spec.whatwg.org/multipage/sections.html#the-var-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<samp>`](https://html.spec.whatwg.org/multipage/sections.html#the-samp-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<kbd>`](https://html.spec.whatwg.org/multipage/sections.html#the-kbd-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<sub>`](https://html.spec.whatwg.org/multipage/sections.html#the-sub-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<i>`](https://html.spec.whatwg.org/multipage/sections.html#the-i-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<b>`](https://html.spec.whatwg.org/multipage/sections.html#the-b-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<u>`](https://html.spec.whatwg.org/multipage/sections.html#the-u-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<mark>`](https://html.spec.whatwg.org/multipage/sections.html#the-mark-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<bdi>`](https://html.spec.whatwg.org/multipage/sections.html#the-bdi-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<bdo>`](https://html.spec.whatwg.org/multipage/sections.html#the-bdo-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 
[`<span>`](https://html.spec.whatwg.org/multipage/sections.html#the-span-element) | ``Span`` 
[`<br>`](https://html.spec.whatwg.org/multipage/sections.html#the-br-element) | ``Linebreak`` 
[`<wbr>`](https://html.spec.whatwg.org/multipage/sections.html#the-wbr-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25) 

### Embedded content

 W3C tag | Slipstream view
:--------|:----------------
[`<picture>`](https://html.spec.whatwg.org/multipage/sections.html#the-picture-element) | ``Picture``
[`<source>`](https://html.spec.whatwg.org/multipage/sections.html#the-source-element) | ``Source``
[`<img>`](https://html.spec.whatwg.org/multipage/sections.html#the-img-element) | ``Image``
[`<iframe>`](https://html.spec.whatwg.org/multipage/sections.html#the-iframe-element) | ``IFrame``
[`<embed>`](https://html.spec.whatwg.org/multipage/sections.html#the-embed-element) | ``Embed``
[`<object>`](https://html.spec.whatwg.org/multipage/sections.html#the-object-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<video>`](https://html.spec.whatwg.org/multipage/sections.html#the-video-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<audio>`](https://html.spec.whatwg.org/multipage/sections.html#the-audio-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<track>`](https://html.spec.whatwg.org/multipage/sections.html#the-track-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<map>`](https://html.spec.whatwg.org/multipage/sections.html#the-map-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<area>`](https://html.spec.whatwg.org/multipage/sections.html#the-area-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)

### Tabular data

 W3C tag | Slipstream view
:--------|:----------------
[`<table>`](https://html.spec.whatwg.org/multipage/sections.html#the-table-element) | ``Table``
[`<caption>`](https://html.spec.whatwg.org/multipage/sections.html#the-caption-element) | ``Caption``
[`<colgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-colgroup-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<col>`](https://html.spec.whatwg.org/multipage/sections.html#the-col-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
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
[`<label>`](https://html.spec.whatwg.org/multipage/sections.html#the-label-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<input>`](https://html.spec.whatwg.org/multipage/sections.html#the-input-element) | ``TextField``
[`<button>`](https://html.spec.whatwg.org/multipage/sections.html#the-button-element) | ``Button``
[`<select>`](https://html.spec.whatwg.org/multipage/sections.html#the-select-element) | ``Picker``
[`<datalist>`](https://html.spec.whatwg.org/multipage/sections.html#the-datalist-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<optgroup>`](https://html.spec.whatwg.org/multipage/sections.html#the-optgroup-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<option>`](https://html.spec.whatwg.org/multipage/sections.html#the-option-element) | ``Option``
[`<textarea>`](https://html.spec.whatwg.org/multipage/sections.html#the-textarea-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<output>`](https://html.spec.whatwg.org/multipage/sections.html#the-output-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<progress>`](https://html.spec.whatwg.org/multipage/sections.html#the-progress-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<meter>`](https://html.spec.whatwg.org/multipage/sections.html#the-meter-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<fieldset>`](https://html.spec.whatwg.org/multipage/sections.html#the-fieldset-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<legend>`](https://html.spec.whatwg.org/multipage/sections.html#the-legend-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)

### Interactive elements

 W3C tag | Slipstream view
:--------|:----------------
[`<details>`](https://html.spec.whatwg.org/multipage/sections.html#the-details-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<summary>`](https://html.spec.whatwg.org/multipage/sections.html#the-summary-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<dialog>`](https://html.spec.whatwg.org/multipage/sections.html#the-dialog-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)

### Scripting

 W3C tag | Slipstream view
:--------|:----------------
[`<script>`](https://html.spec.whatwg.org/multipage/sections.html#the-script-element) | ``Script``
[`<noscript>`](https://html.spec.whatwg.org/multipage/sections.html#the-noscript-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<template>`](https://html.spec.whatwg.org/multipage/sections.html#the-template-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<slot>`](https://html.spec.whatwg.org/multipage/sections.html#the-slot-element) | [Not implemented yet](https://github.com/jverkoey/slipstream/issues/25)
[`<canvas>`](https://html.spec.whatwg.org/multipage/sections.html#the-canvas-element) | ``Canvas``
