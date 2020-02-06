FROM openjdk:8-jdk-alpine
ARG JAR_FILE=gs-spring-boot-docker/initial/target/gs-spring-boot-docker-0.1.0.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/gs-spring-boot-docker-0.1.0.jar"]
