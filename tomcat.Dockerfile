FROM tomcat:8-alpine
RUN cp /src/lsn12_new/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/