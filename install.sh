#!/bin/bash
# 卸载原有docker相关软件
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
# 安装依赖
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
# 设置稳定的存储库
sudo yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# 列出可用docker版本
yum list docker-ce --showduplicates | sort -r
# 获取终端输入的版本
read -p "请选择需要安装的版本：" DockerVersion
# 安装docker
yum -y install $DockerVersion
# 启动docker
sudo systemctl start docker
sudo systemctl enable docker
# 获取docker版本
docker version
# 安装完成
echo "恭喜，安装完成！"
