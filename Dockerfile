FROM maven:3.6-jdk-8-alpine
WORKDIR /build
RUN apk update && apk add git
RUN mkdir -p /build/webapps
RUN git clone https://github.com/ArtemVakhitov/lsn12_new.git
WORKDIR /build/lsn12_new
# RUN echo "app42.paas.db.password = $(cat /run/secrets/db_root_password)" >> WebContent/Config.properties
RUN mvn clean && mvn install && cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war ../webapps/ 