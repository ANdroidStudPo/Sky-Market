#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    local version="your-version-here"
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading CustomApp"
    curl -O "your-download-url-here/CustomApp.zip"

    echo -e "Installing CustomApp"
    unzip -o -q "./CustomApp.zip"

    echo -e "Patching Roblox"
    mv ./customlibrary.dylib "/Applications/Roblox.app/Contents/MacOS/customlibrary.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/customlibrary.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    rm ./insert_dylib

    echo -e "Installing CustomApp"
    [ -d "/Applications/CustomApp.app" ] && rm -rf "/Applications/CustomApp.app"
    mv ./CustomApp.app /Applications/CustomApp.app
    rm ./CustomApp.zip

    echo -e "Install Complete! Developed by YourName!"
}

main
