FROM 8.5.92-jdk8-temurin
RUN apt-get update && apt-get install git maven
RUN git clone https://github.com/ArtemVakhitov/lsn12_new.git
WORKDIR lsn12_new
RUN mvn clean && mvn install && cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ 