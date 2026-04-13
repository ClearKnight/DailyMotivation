# DailyMotivation

macOS 屏幕保护程序，展示时间与励志名言，融入你的桌面壁纸。

## 效果预览

屏保启动后，你的桌面壁纸自然透出，上方显示实时时间，中央展示一句有力量的话：

```
           [你的桌面壁纸]

                  14:32:06

     「纵有狂风拔地起，我亦乘风破万里」
                    —— 李白

```

## 特性

- **壁纸融合** - 自动捕获当前桌面壁纸作为背景
- **实时时间** - 每秒更新时间
- **励志名言** - 29 条精选唐诗宋词与经典格言
- **极简设计** - 小而美，无多余功能
- **零依赖** - 原生 ScreenSaver.framework

## 名言预览

- 「纵有狂风拔地起，我亦乘风破万里」—— 李白
- 「长风破浪会有时，直挂云帆济沧海」—— 李白
- 「会当凌绝顶，一览众山小」—— 杜甫
- 「路漫漫其修远兮，吾将上下而求索」—— 屈原
- 「天行健，君子以自强不息」—— 周易
- ...

## 构建

```bash
# 安装 XcodeGen（如果未安装）
brew install xcodegen

# 生成 Xcode 项目
xcodegen generate

# 构建
xcodebuild -project DailyMotivation.xcodeproj -scheme DailyMotivation -configuration Release build
```

## 安装

```bash
cp -r ~/Library/Developer/Xcode/DerivedData/DailyMotivation-*/Build/Products/Release/DailyMotivation.saver ~/Library/Screen\ Savers/
```

然后在 **系统设置 → 屏幕保护程序** 中选择 DailyMotivation。

## 卸载

```bash
rm ~/Library/Screen\ Savers/DailyMotivation.saver
```

## 项目结构

```
DailyMotivation/
├── project.yml                    # XcodeGen 配置
├── QuoteManager.swift             # 名言管理
├── Screensaver/
│   ├── DailyMotivationView.swift # 主视图
│   └── Info.plist                # Bundle 配置
└── Resources/
    └── quotes.json               # 名言数据
```

## 技术栈

- Swift 5.9
- ScreenSaver.framework
- AppKit
- XcodeGen

## License

MIT
