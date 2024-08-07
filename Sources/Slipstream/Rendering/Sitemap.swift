/// A path relative to some root directory.
public typealias RelativePath = String

/// A sitemap is a mapping of relative filesystem paths to Slipstream views.
public typealias Sitemap = [RelativePath: any View]
