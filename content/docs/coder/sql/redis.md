---
title: redis 使用
---

```python
import redis
import traceback
from urllib import unquote

r = redis.StrictRedis(host='[ip]', port=8379, db=0)

fLogs = open("./log", "r")
fResult = open("./mysql.txt", "w")

fRes = []
countLog = 0
while True:
    countLog += 1
    line = fLogs.readline()
    if line:
        try:
            if countLog % 100 == 0:
                print "done log:", countLog
            line = line.strip('\n')
            if 'true' in line:
                curl = line.split("'")[1]
                href = curl.split("?")[1].split("&")
                params = {}
                for v in href:
                    params[v.split("=")[0]] = v.split("=")[1]
                temp = params.get('vn', '')
                vn = r.get(temp)
                fRes.append('\t'.join([vn]).encode('utf-8') + '\r\n')
        except Exception as e:
            traceback.print_exc(e)
            pass
    else:
        break

fLogs.close()

fResult.writelines(fRes)
fResult.close()

print "write mysql.txt for mysql"
```