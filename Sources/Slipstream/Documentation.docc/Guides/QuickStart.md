# Quick start

A guide to creating your first Slipstream website, quick-like.

In this guide we'll make a website called hogmobile.com.

For an even faster quick-start, you can clone the template
repo at https://github.com/jverkoey/slipstream-site-template/.

## Prerequisites

- Install Xcode
- Install Tailwind CSS

```bash
npm install -D tailwindcss
```

## Workspace setup

### Create your site package

```bash
mkdir hogmobile.com
cd hogmobile.com
swift package init --type executable
swift build
swift run
```

Also initialize Tailwind CSS:

```
npx tailwindcss init
```

### Open your package in Xcode

```bash
open Package.swift
```

### Add Slipstream as a dependency

Check the following:

- Swift tools version is 5.10
- Minimum platforms OS requirements are iOS 17 and macOS 14
- Add the package dependency to your package.
- Add the Slipstream product dependency to your executable target.

Edit `Package.swift` in the root of your package:

```swift
// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "hogmobile",
  platforms: [
    .macOS("14"),
    .iOS("17"),
  ],
  dependencies: [
    .package(url: "https://github.com/jverkoey/slipstream.git", branch: "main"),
  ],
  targets: [
    .executableTarget(name: "hogmobile", dependencies: [
      .product(name: "Slipstream", package: "slipstream"),
    ]),
  ]
)
```

## Generate a basic site

Edit `Sources/main.swift`:

```swift
import Foundation
import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

let sitemap: Sitemap = [
  "index.html": HelloWorld()
]

// Assumes this file is located in a Sources/ sub-directory of a Swift package.
let projectURL = URL(filePath: #filePath)
  .deletingLastPathComponent()
  .deletingLastPathComponent()

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
```

### Configure Tailwind CSS

Define where your site content will be rendered. In our case, we'll be writing it to the `site/`
folder.

Edit `tailwind.config.js` in the root of your package:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./site/**/*.html"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

Create a `tailwind.css` in the root of your package:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Generate your site

```bash
swift run && npx tailwindcss -i tailwind.css -o ./site/output.css --minify
```

## Prepare for deployment to the web

### Set your site's CNAME

If you plan on hosting your site using a custom domain name on GitHub pages,
create a `CNAME` file in the root of your package and add the domain name to
it:

```
hogmobile.com
```

### Set up a GitHub action

Create a file named `.github/workflows/deploy.yml` and add the following:

```yaml
name: Deploy site to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # Single deploy job since we're just deploying
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: macos-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Install Tailwind CSS
        run: npm install -D tailwindcss@latest
      - name: Generate site
        run: swift run && npx tailwindcss -i tailwind.css -o ./site/output.css --minify
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload entire repository
          path: './site'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

## Deploy to GitHub

In this section we'll deploy our website to GitHub and publish it to the internet
using GitHub Pages.

### Set up your GitHub repo

Create a new GitHub repository at https://github.com/new

Don't initialize the repository with a README file or gitignore.

### Configure your gitignore

First edit your `.gitignore` to make sure you don't push the generated html:

```
# Slipstream site output
site/

# Standard Swift package
.DS_Store
/.build
/Packages
xcuserdata/
DerivedData/
.swiftpm/configuration/registries.json
.swiftpm/xcode/package.xcworkspace/contents.xcworkspacedata
.netrc
```

### Initialize your git repo

In the root folder of your package, run the following:

```
git init
git add .
git commit -m "Initial commit"
```

### Set up remote

```
git remote add origin git@github.com:jverkoey/hogmobile.com.git
git push origin main -u
```

### Configure your site DNS

Follow GitHub's guide on setting up your domain's DNS to point to GitHub Pages:

https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain

### Configure your repo's Pages settings

Open your GitHub repository's Settings > Pages.

https://github.com/jverkoey/hogmobile.com/settings/pages

- Set the "Build and deployment" source to "GitHub Actions".
- Set "Custom domain" to your site domain (in this case hogmobile.com). Click Save.
- A DNS check will begin.

## Troubleshooting

### error: 'hogmobile.com': package 'hogmobile.com' is using Swift tools version 6.0.0 but the installed version is 5.10.0

Check your `Package.swift`'s first line. In this case it should be:

```
// swift-tools-version: 5.10
```

Though this version number will change over time as new stable versions of Xcode are released. 
