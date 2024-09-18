FROM maven:3.6-jdk-8-alpine
WORKDIR /build
RUN apk update && apk add git
RUN mkdir -p /build/webapps
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
WORKDIR /build/App42PaaS-Java-MySQL-Sample
RUN sed -i '/<artifactId>mysql-connector-java<\/artifactId>/,/<\/version>/s/<version>5\.1\.8<\/version>/<version>8.0.28<\/version>/' pom.xml
COPY Config.properties WebContent/Config.properties
RUN echo -ne "app42.paas.db.password = $(cat /run/secrets/db_root_password)" >> WebContent/Config.properties
RUN mvn clean && mvn install && cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war ../webapps/ 