#指定基础镜像
FROM ubuntu
#作者
MAINTAINER LH
#指定字符集很重要
ENV  LANG C.UTF-8
#执行命令
RUN apt-get update
RUN apt-get install vim -y
RUN mkdir  -p /home/jdk
#切换工作目录
WORKDIR   /home/jdk
#容器打开指定要监听的端口以实现和外部通信
EXPOSE 22
#添加文件,ADD指令会将文件自动解压
#如果项目在运行时不要jdk编译成class文件，则可以打jre运行镜像，jre比jdk要小很多
ADD  ./jdk-8u144-linux-x64.tar.gz  /home/jdk
#配置环境变量
RUN echo  JRE_HOME=/home/jdk/jdk1.8.0_144  >> /etc/environment
RUN echo  CLASSPATH=$JAVA_HOME/lib >> /etc/environment
RUN echo  PATH=$JAVA_HOME/bin  >> /etc/environment
RUN update-alternatives --install /usr/bin/java java  /home/jdk/jdk1.8.0_144/bin/java 300
