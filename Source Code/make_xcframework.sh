#!/bin/bash

title="Select build configuration"
prompt="Pick a configuration:"
options=("Debug" "Release")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}"; do
    case "$REPLY" in
    1) echo "Building debug framework...";break;;
    2) echo "Building release framework...";break;;
    *) echo "Invalid option. Try again.";continue;;
    esac
done

if [ "$REPLY" -eq 1 ]; then
    rm -rf GithubAPI-Debug.xcframework
    test="test"
    build_configuration="Debug"
    xcframework_postfix="-Debug"
else
    rm -rf GithubAPI.xcframework
    test=""
    build_configuration="Release"
    xcframework_postfix=""
fi

rm -rf build/Build/Products/

xcodebuild \
  -scheme GithubAPI \
  -sdk iphonesimulator \
  -derivedDataPath build \
  -configuration $build_configuration \
  -destination 'platform=iOS Simulator,name=iPhone 12' \
  $test \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  ENABLE_BITCODE=YES \
  OTHER_CFLAGS="-fembed-bitcode" \
  BITCODE_GENERATION_MODE="bitcode"

xcodebuild \
  -scheme GithubAPI \
  -sdk iphoneos \
  -derivedDataPath build \
  -configuration $build_configuration \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  ENABLE_BITCODE=YES \
  OTHER_CFLAGS="-fembed-bitcode" \
  BITCODE_GENERATION_MODE="bitcode"
  
xcodebuild -create-xcframework \
    -framework build/Build/Products/$build_configuration-iphoneos/GithubAPI.framework \
    -framework build/Build/Products/$build_configuration-iphonesimulator/GithubAPI.framework \
    -output GithubAPI$xcframework_postfix.xcframework



