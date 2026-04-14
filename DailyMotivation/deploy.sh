#!/bin/bash
cd "$(dirname "$0")"
xcodebuild -project DailyMotivation.xcodeproj -scheme DailyMotivation -configuration Release build
SAVER_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "DailyMotivation.saver" -type d 2>/dev/null | head -1)
mkdir -p "$HOME/Library/Screen Savers"
cp -r "$SAVER_PATH" "$HOME/Library/Screen Savers/"
echo "部署完成"
