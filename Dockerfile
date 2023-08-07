FROM maven as build
COPY . /app
WORKDIR /app
RUN mvn clean compile
RUN mvn package

FROM openjdk:8u201-jre-alpine3.9 AS runapp
WORKDIR /run
COPY --from=BUILD /app/target/sampleapp-0.0.1-SNAPSHOT.jar /run/sampleapp.jar

CMD java -jar sampleapp.jar
