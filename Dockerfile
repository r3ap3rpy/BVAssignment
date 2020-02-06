FROM openjdk:8-jdk-alpine
ARG JAR_FILE=app/initial/target/gs-spring-boot-docker-0.1.0.jar
COPY app ./app
CMD chmod u+x ./app/initial/mvnw
CMD ./app/initial/mvnv package
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/gs-spring-boot-docker-0.1.0.jar"]
