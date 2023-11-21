---
title: rsync 更新
---

```bash
echo "========================================"
echo "COPY TO SERVER..."

/usr/bin/expect << EOF

  set timeout -1

  spawn rsync -cauvz -e "/usr/bin/ssh -lroot -oStrictHostKeyChecking=no -p0000" build/ root@[ip]:/[serverpath]

  expect {
    "password:" { send "pwd\n" }
    "sec]." { exit }
  }

EOF
```
