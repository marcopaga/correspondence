#!/bin/bash
xcodebuild -target "UnitTests" -sdk macosx10.6 -configuration "Debug" clean build
