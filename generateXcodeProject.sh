#!/bin/bash

set -e 

# clean swift package
rm -rdf .build/
swift package clean

# install dependencies
bundle install
swift package update

# generate project
#   --enable-code-coverage		Enable code coverage in the generated project
#	--legacy-scheme-generator	Use the legacy scheme generator
#	--output                	Path where the Xcode project should be generated
#	--watch                 	Watch for changes to the Package manifest to regenerate the Xcode project
#	--xcconfig-overrides    	Path to xcconfig file
swift package generate-xcodeproj  --enable-code-coverage

# add project specialities
bundle exec ./prepareXcodeProject.rb

# open project
open *.xcodeproj
