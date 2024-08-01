#!/bin/bash

swift package \
  --allow-writing-to-directory docs \
  generate-documentation \
  --target Slipstream \
  --disable-indexing \
  --transform-for-static-hosting \
  --hosting-base-path StringScannerKit \
  --output-path docs
