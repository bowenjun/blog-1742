---
title: python 解析数据存 redis
---

首先将数据解析成一个 `txt`

```python
import traceback

fRead = open("./path", "r")
fResult = open("./result.txt", "w")

fRes = []
while True:
    line = fRead.readline()
    if line:
        try:
            line = line.strip('\n')
            line = line.split("\t")
            key = line[0]
            value = line[1]
            fRes.append('set ' + key + ' ' + value + '\r\n')
        except Exception as e:
            traceback.print_exc(e)
            pass
    else:
        break
fRead.close()

fResult.writelines(fRes)
fResult.close()

print "write result.txt for redis"
```

然后使用 `redis` 批量插入

```bash
cat ./result.txt | redis-cli -h [host] -p [port] --pipe
```