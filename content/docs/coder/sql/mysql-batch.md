---
title: mysql 批量写入
---

当数据量过大时，逐条插入数据会很慢，使用 `LOAD DATA LOCAL INFILE` 命令将会大大提高效率

```python
import MySQLdb
import traceback
from urllib import unquote

db = MySQLdb.connect(
    host='[ip]',
    port=8306,
    user='[user]',
    passwd='[pwd]',
    db='[db]',
    charset='utf8',
)

cursor = db.cursor()

cursor.execute(
    "\
    LOAD DATA LOCAL INFILE 'mysql.txt' \
    INTO TABLE luui_data character set utf8 \
    FIELDS TERMINATED BY '\t' \
    ENCLOSED BY '/' \
    LINES TERMINATED BY '\n' \
    ([t1], [t2], ...)\
    ",
)

db.commit()

print "load file inline success!"

cursor.close()

db.close()
```