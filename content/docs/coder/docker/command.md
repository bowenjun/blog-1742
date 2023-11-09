---
title: Docker commands
---

#### Login 

> docker login "docker.[origin]" -u [username] -p [password] 

#### Pull 

> docker pull [image]:[version]

#### Push 

> docker push docker.[origin]/[newimage]:[version]

#### 运行容器

> docker run -p 80:80 -d [image]:[version]

#### 运行后 /bin/bash

> docker run -it [image]:[version] /bin/bash

#### 进入容器

> docker exec -it id /bin/bash

#### 查看镜像 

> docker images

#### Tag 

> docker tag [image]:[version] docker.[origin]/[newimage]:[version] 

#### 打包镜像 

> docker image build -t docker.[origin]/[newimage]:[version] . 

