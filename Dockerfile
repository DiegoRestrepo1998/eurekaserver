FROM maven:3.8-openjdk-17 AS build

COPY src /usr/src/app/src

COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:17-alpine

COPY --from=build /usr/src/app/target/eurekaserver.jar /usr/app/eurekaserver.jar

ENTRYPOINT ["java","-jar","/usr/app/eurekaserver.jar"]