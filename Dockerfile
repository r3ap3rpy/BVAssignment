FROM openjdk:8-jdk-alpine
COPY ./app/initial/target/gs-spring-boot-docker-0.1.0.jar .
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/gs-spring-boot-docker-0.1.0.jar"]
