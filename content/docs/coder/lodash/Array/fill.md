---
title: _.fill
---

> _.fill(array, value, [start=0], [end=array.length])

#### 使用

使用 value 值来填充（替换） array，从 start 位置开始, 到 end 位置结束（但不包含 end 位置）。
注：这个方法会改变 array

#### 实现

```js
function fill(array, value, start = 0, end) {
  let length = array == null ? 0 : array.length;
  if (!length) {
    return [];
  }

  // start 为负数的情况，通过 start + length 来取到计算用的 start
  if (start < 0) {
    start = -start > length ? 0 : (start + length);
  }

  // 取到计算用到的 end
  end = (end === undefined || end > length) ? length : end;

  // end 如果是负数也用 end + length 来取值
  if (end < 0) {
    end += length;
  }

  // 将 start - end 区间内的数据替换为 value
  while (start < end) {
    array[start++] = value;
  }
  return array;
}

let res = fill([4, 6, 8, 10], '*', 1, 3);
// => [4, '*', '*', 10]

console.log(res);
```