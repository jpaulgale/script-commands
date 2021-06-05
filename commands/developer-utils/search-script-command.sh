#!/bin/bash

# Dependency: This script requires `swift` installed.
# Install via https://swift.org/download/

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Script Command (Bash)
# @raycast.mode fullOutput
# @raycast.packageName Searches
#
# Optional parameters:
# @raycast.author Thiago Holanda
# @raycast.authorURL https://twitter.com/tholanda
# @raycast.icon 🔎
# @raycast.description Search for Script Commands available in the Raycast repository
# @raycast.argument1 { "type": "text", "placeholder": "Query"}

#  Files related to this Script Command:
#  - search-script-command.sh (this file)
#  - search-script-command.swift
#  - search-script-command (this binary file will be generated by swiftc)

filename=${0##*/}
basename=${filename%.*}
swift_filename="$basename.swift"

if [ ! -f $basename ] && [ -f $swift_filename ]; then
  $(swiftc $swift_filename -emit-executable -o $basename)
fi

./$basename "$1"