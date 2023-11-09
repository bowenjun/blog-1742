---
title: _.chunk
---

> _.chunk(array, [size=1])

#### 使用

将数组（array）拆分成多个 size 长度的区块，并将这些区块组成一个新数组。 如果 array 无法被分割成全部等长的区块，那么最后剩余的元素将组成一个区块。

```js
_.chunk(['a', 'b', 'c', 'd'], 2);
// => [['a', 'b'], ['c', 'd']]
 
_.chunk(['a', 'b', 'c', 'd'], 3);
// => [['a', 'b', 'c'], ['d']]
```

#### 实现

```js
function chunk(array, size) {
  // 获取数组长度
  let length = array == null ? 0 : array.length;
  // 空数组或者 size < 1 直接返回 []
  if (!length || size < 1) return [];
  // 定义变量
  let result = Array.from({ length: Math.ceil(length / size) }),
    arrayIndex = 0,
    resIndex = 0;
  // 使用 slice 裁剪数组片段
  while (arrayIndex < length) {
    result[resIndex++] = array.slice(arrayIndex, arrayIndex += size);
  }
  return result;
}
let res1 = chunk(['a', 'b', 'c', 'd'], 2);
// => [['a', 'b'], ['c', 'd']]
 
let res2 = chunk(['a', 'b', 'c', 'd'], 3);
// => [['a', 'b', 'c'], ['d']]
console.log(res1, res2);
```