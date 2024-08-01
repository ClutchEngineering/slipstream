#!/bin/bash

swift package \
  --disable-sandbox \
  preview-documentation \
  --target Slipstream
