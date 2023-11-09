---
title: Tree-Shaking
---

## Tree-Shaking

### DCE (dead code elimination)

- 代码不会被执行，不可到达
- 代码执行的结果不会被用到
- 代码只会影响死变量，只写不读

传统编译型预言是将 `dead code` 在 `ast` 中删除，而 `tree-shaking` 更关注于消除引用了但没有被使用的模块，依赖于 `ES6` 的模块特性。

#### ES6 module

- 只能作为模块顶层的语句出现
- `import` 的模块名只能是字符串常量
- `import binding` 是 `immutable`

### 流程

- `ES6` 的模块引入是静态分析的，可以在编译时正确判断到底加载了什么代码
- 分析程序流，判断哪些变量被使用、引用，打包这些代码
    - 基于作用域，在 AST 过程中对函数或全局对象形成对象记录，然后在整个形成的作用域链对象中进行匹配 import 导入的标识，最后只打包匹配的代码，而删除那些未被匹配使用的代码

### 具体实现

`rollup` 中的 `tree-shaking` 使用 `acorn` 实现 `ast` 抽象语法树的遍历解析，`acorn` 和 `babel` 功能相同，但 `acorn` 更加轻量，在此之前 `ast` 工作流也是必须要了解的。

`rollup` 使用 `magic-string` 工具操作字符串和生成 `source-map`。

`rollup()` 阶段，解析源码，生成 `ast tree`，对 `ast tree` 上的每个节点进行遍历，判断出是否 `include`(标记避免重复打包)，是的话标记，然后生成 `chunks`，最后导出。

`generate()/write()` 阶段，根据 `rollup()` 阶段做的标记，进行代码收集，最后生成真正用到的代码。
