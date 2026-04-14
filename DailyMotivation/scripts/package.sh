#!/bin/bash
set -e

cd "$(dirname "$0")/.."
PROJECT_DIR=$(pwd)

echo "正在构建 DailyMotivation..."

# 构建项目
xcodebuild -project DailyMotivation.xcodeproj -scheme DailyMotivation -configuration Release build

# 找到构建产物
SAVER_PATH=$(find ~/Library/Developer/Xcode/DerivedData -name "DailyMotivation.saver" -type d | head -1)

if [ -z "$SAVER_PATH" ]; then
    echo "错误：未找到构建产物 DailyMotivation.saver"
    exit 1
fi

echo "构建产物：$SAVER_PATH"

# 清理旧文件
rm -f DailyMotivation.saver.zip

# 打包（切换到项目目录再打包，避免zip包含完整路径）
cd "$PROJECT_DIR"
cp -r "$SAVER_PATH" ./DailyMotivation.saver
zip -r DailyMotivation.saver.zip DailyMotivation.saver
rm -rf DailyMotivation.saver

echo ""
echo "打包完成：DailyMotivation.saver.zip"
echo "大小：$(du -h DailyMotivation.saver.zip | cut -f1)"
echo ""
echo "上传到 GitHub Releases 即可发布新版本。"
