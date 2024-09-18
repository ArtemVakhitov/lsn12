FROM maven:3.6-jdk-8-alpine
WORKDIR /src
RUN apk update && apk add git
RUN git clone https://github.com/ArtemVakhitov/lsn12_new.git
WORKDIR /src/lsn12_new
# RUN echo "app42.paas.db.password = $(cat /run/secrets/db_root_password)" >> WebContent/Config.properties
RUN mvn clean && mvn install 