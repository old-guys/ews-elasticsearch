## 聚石塔 spring 镜像

> 用于 elasticsearch

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
sudo docker build -t ikcrm/ews-elasticsearch:5.6.0-1 .
sudo docker tag 2949d4e6eb6a registry.acs.aliyun.com/1089176875114090/ikcrm/ikcrm/ews-elasticsearch:5.6.0-1
sudo docker push registry.acs.aliyun.com/1089176875114090/ikcrm/ikcrm/ews-elasticsearch:5.6.0-1
```
