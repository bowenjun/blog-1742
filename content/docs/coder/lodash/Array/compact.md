---
title: _.compact
---

## _.compact(array)

### 使用

创建一个新数组，包含原数组中所有的非假值元素。例如 `false`，`null`，`0`，`""`，`undefined` 和 `NaN` 都是被认为是“假值”。

```js
_.compact([0, 1, false, 2, '', 3]);
// => [1, 2, 3]
```

### 实现

```js
function compact(array) {
  let index = -1,
    length = array == null ? 0 : array.length,
    resIndex = 0,
    result = [];
  while (++index < length) {
    let value = array[index];
    // 直接判断值是否为 假值
    if (value) {
      result[resIndex++] = value;
    }
  }
  return result;
}
let res1 = compact([0, 1, false, 2, '', 3]);
// => [1, 2, 3]
console.log(res1);
```