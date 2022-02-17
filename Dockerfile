FROM tomcat:9.0.58-jre11-openjdk-slim-buster

RUN apt-get update -y
RUN apt-get install nano -y 

WORKDIR /usr/local/tomcat

RUN cp -r webapps.dist/* webapps 
COPY tomcat/tomcat-users.xml conf/tomcat-users.xml
COPY tomcat/context.xml webapps/manager/META-INF/context.xml
EXPOSE 8080 

CMD ["catalina.sh", "run"]

