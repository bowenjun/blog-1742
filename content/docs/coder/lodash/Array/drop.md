---
title: _.drop
---

## _.drop(array, [n=1])

### 使用

```js
_.drop(array, [n=1]) // 创建一个切片数组，去除array前面的n个元素。（n默认值为1。）
_.dropWhile(array, [predicate=_.identity]) // 创建一个切片数组，去除array中从起点开始到 predicate 返回假值结束部分。predicate 会传入3个参数： (value, index, array)。
_.dropRight(array, [n=1]) // 创建一个切片数组，去除array尾部的n个元素。（n默认值为1。）
_.dropRightWhile(array, [predicate=_.identity]) // 创建一个切片数组，去除array中从 predicate 返回假值开始到尾部的部分。predicate 会传入3个参数： (value, index, array)。
```

### 实现

```js
const _ = require('../source');

function drop(array, n = 1) {
  let length = array == null ? 0 : array.length;
  if (!length) {
    return [];
  }
  return array.slice(n < 0 ? 0 : n, length);
}

let res1 = drop([1, 2, 3]);
// => [2, 3]

function dropRight(array, n = 1) {
  let length = array == null ? 0 : array.length;
  if (!length) {
    return [];
  }
  n = length - n;
  return array.slice(0, n < 0 ? 0 : n);
}

let res2 = dropRight([1, 2, 3]);
// => [1, 2]

function dropWhile(array, predicate) {
  let length = array == null ? 0 : array.length;
  if (!length) {
    return [];
  }
  return baseWhile(array, _.iteratee(predicate), false);
}

function dropRightWhile(array, predicate) {
  let length = array == null ? 0 : array.length;
  if (!length) {
    return [];
  }
  return baseWhile(array, _.iteratee(predicate), true);
}

function baseWhile(array, predicate, fromRight) {
  let length = array.length,
    index = -1;

  if (fromRight) {
    index = length;
    while (index-- && predicate(array[index], index, array)) { }
    return array.slice(0, index + 1);
  }

  while ((++index < length) && predicate(array[index], index, array)) { }
  return array.slice(index, length);
}

let users = [
  { 'user': 'barney', 'active': false },
  { 'user': 'fred', 'active': true },
  { 'user': 'pebbles', 'active': false }
];

let res3 = dropWhile(users, function (o) { return !o.active; });
// => [ { user: 'fred', active: true }, { user: 'pebbles', active: false } ]

let res4 = dropRightWhile(users, function (o) { return !o.active; });
// => [ { user: 'barney', active: false }, { user: 'fred', active: true } ]

console.log(res1, res2, res3, res4)
```

这里需要使用到 `_.iteratee` 方法，实现方法参考 `_.iteratee` 。