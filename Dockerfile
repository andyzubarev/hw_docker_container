FROM tomcat:8.5.56-jdk11-openjdk
RUN apt-get update && apt-get install -y maven
RUN mkdir /myapp/
WORKDIR /myapp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /myapp/boxfuse-sample-java-war-hello/
RUN mvn package
WORKDIR /myapp/boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
