# DailyMotivation - 产品计划

## 1. 产品概述

- **产品名称**: DailyMotivation
- **类型**: macOS 屏幕保护程序
- **核心功能**: 屏保运行时展示时间 + 一句有力量的话
- **设计理念**: 小而美，极简主义，融入壁纸

---

## 2. 功能需求

| 功能 | 描述 | 状态 |
|------|------|------|
| 时间展示 | 当前时间（时:分:秒），实时更新 | ✅ 已完成 |
| 名言展示 | 从本地 quotes.json 随机获取一句 | ✅ 已完成 |
| 壁纸背景 | 自动捕获桌面壁纸作为背景 | ✅ 已完成 |
| 文字阴影 | 白色文字带阴影，确保可读性 | ✅ 已完成 |

**设计原则**：
- 不需要主题切换
- 不需要日历倒计时、天气等附加功能
- 不需要多语言支持，只保留汉语
- 最小依赖，保持项目简单

---

## 3. UI 布局

```
┌─────────────────────────────────────────────┐
│           [桌面壁纸作为背景]                  │
│                                             │
│                  14:32:06                   │  ← 时间，白色带阴影
│                                             │
│        「纵有狂风拔地起，我亦乘风破万里」      │  ← 名言，白色带阴影
│                    —— 李白                   │  ← 作者，白色带阴影
│                                             │
└─────────────────────────────────────────────┘
```

- **背景**: 桌面壁纸（自动捕获）
- **文字**: 白色，带阴影提高可读性
- **布局**: 时间在上，名言居中，作者在名言下方
- **字体**: 系统字体 SF Pro

---

## 4. 技术方案

### 4.1 技术栈

- **语言**: Swift 5.9
- **框架**: ScreenSaver.framework, AppKit
- **最低版本**: macOS 12.0
- **依赖**: 无第三方依赖

### 4.2 项目结构

```
DailyMotivation/
├── project.yml                    # XcodeGen 配置
├── QuoteManager.swift              # 名言管理（单例）
├── Screensaver/
│   ├── DailyMotivationView.swift   # 主视图
│   └── Info.plist                  # Bundle 配置
└── Resources/
    └── quotes.json                 # 名言数据（29条）
```

---

## 5. 里程碑

| 阶段 | 目标 | 状态 |
|------|------|------|
| M1 | 基础框架 + 时间展示 | ✅ 已完成 |
| M2 | 名言展示整合 | ✅ 已完成 |
| M3 | 壁纸背景捕获 | ✅ 已完成 |
| M4 | 文字阴影优化 | ✅ 已完成 |

---

## 6. 构建与安装

```bash
# 生成 Xcode 项目
xcodegen generate

# 构建
xcodebuild -project DailyMotivation.xcodeproj -scheme DailyMotivation -configuration Release build

# 安装到 ~/Library/Screen Savers
cp -r ~/Library/Developer/Xcode/DerivedData/DailyMotivation-*/Build/Products/Release/DailyMotivation.saver ~/Library/Screen\ Savers/
```

安装后在 **系统设置 → 屏幕保护程序** 中选择 DailyMotivation。
