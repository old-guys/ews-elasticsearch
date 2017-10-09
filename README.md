## 聚石塔 spring 镜像

> 用于 java 搜索服务，导入服务

- https://testerhome.com/topics/2760 docker guide
- https://www.unixmen.com/install-oracle-java-jdk-8-centos-76-56-4/

## 聚石塔 centos 镜像

```shell
docker pull registry.acs.aliyun.com/open/centos:3.0.0
```

```shell
私有镜像地址：https://registry.acs.aliyun.com
用户名：xxxxxxxxxxxxx
xxxxxxxxx
```

## build docker image from Dockerfile

```shell
sudo docker build -t ikcrm/java-spring-boot:1.0.3 .
sudo docker tag 4b5ce3709c50 registry.acs.aliyun.com/1089176875114090/ikcrm/java-spring-boot:1.0.3
sudo docker push registry.acs.aliyun.com/1089176875114090/ikcrm/java-spring-boot:1.0.3
```

## 配置镜像启动脚本

这里是容器里面的启动脚本需要手动配置 `/acs/conf/ews_startup.sh` 可以参见

```shell
conf/ews_startup.sh.example
```

## 服务访问地址

```shell
ik-crm-search-service
http://crmjavasearch.hz.taeapp.com/ik-crm-search-service/
http://crmjavasearch.hz-internal.taeapp.com/ik-crm-search-service/
```
