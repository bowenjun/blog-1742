---
title: Adb commands
---

#### 设备列表

> adb devices

#### 安装

> adb install -r app/build/outputs/apk/debug/

#### tcp

> adb reverse tcp:8081 tcp:8081

#### shack

> adb shell input keyevent 82
