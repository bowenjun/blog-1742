---
title: ssh-key
---

### 生成 ssh-key

> ssh-keygen -t rsa -C "email"

生成 `id_rsa` 和 `id_rsa.pub` 两个文件

### 远程机器添加 ssh

在 `~/.ssh/authorized_keys` 中添加 `id_rsa.pub`