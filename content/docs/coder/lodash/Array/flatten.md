---
title: _.flatten
---

## _.flatten(array)

> ES6 已支持 flat、flatMap 方法

### 使用

将数组降级。

```js
_.flatten(array) // 减少一层 array 嵌套深度
_.flattenDeep(array) // 将 array 递归为一维数组
_.flattenDepth(array, [depth=1]) // 根据 depth 递归减少嵌套
```

### 实现

```js
function flatten(array, depth, result = []) {
  let index = -1,
    length = array.length;

  while (++index < length) {
    let value = array[index];
    if (depth > 0 && Array.isArray(value)) {
      if (depth > 1) {
        // 递归
        flatten(value, depth - 1, result);
      } else {
        // 连接数组
        arrayPush(result, value);
      }
    } else {
      // 赋值
      result[result.length] = value;
    }
  }
  return result;
}

function arrayPush(array, values) {
  let index = -1,
    length = values.length,
    offset = array.length;

  while (++index < length) {
    array[offset + index] = values[index];
  }

  return array;
}

let res1 = flatten([1, [2], [3, [4]]], 1);
// [1, 2, 3, [4]]

console.log(res1);
```