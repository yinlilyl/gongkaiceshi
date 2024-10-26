FROM 192.168.81.20:5000/gitee-poc/openjdk:8-jdk-alpine

MAINTAINER osc-qa <osc-qa@oschina.cn>

VOLUME /tmp

ARG JAR_FILE=target/*.jar
RUN mkdir /app
#COPY OUTPUT/target/*.jar /app/demo.jar
COPY target/*.jar /app/demo.jar
EXPOSE 8080

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["nohup", "java","-jar","/app/demo.jar","&"]
