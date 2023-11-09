---
title: mysql 常用
---

### 连接数据库

> mysql -hxx.xx.xx.xx -uroot -p123456

### 查看数据库

> show databases;

### 使用数据库

> use xx;

### 查看表

> show tables;

### 查看表结构

> desc xx;

### 建表

> create table table_name (id int primary key auto_increment, vn varchar(255) not null, unique(vn)) character set utf8;

### 索引

> create (unique) index vn_index on table_name (vn); 

> drop index vn_index on table_name; 

### 插入数据

> insert into table_name values(101),(102);

### 查询数据

> select * from table_name;

> select distinct vn from table_name order by id desc(降序)/asc(升序) group by vn limit 2;

### 使用 utf8mb4

> alter table table_name default character set utf8mb4

### 添加、修改、删除字段

> alter table table_name add(cp text not null);

> alter table table_name change cp newcp int not null;

> alter table table_name drop column cp;

### 删除数据

> delete from table_name where id < 100;

### 删除表

> drop table table_name; 