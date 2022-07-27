FROM maven as build
WORKDIR /usr/app
COPY pom.xml /usr/app/pom.xml
RUN mvn dependency:go-offline -B
COPY src /usr/app/src
RUN mvn package -DskipTests

FROM openjdk:alpine
COPY --from=build /usr/app/target/metadata-service.jar .
EXPOSE 8080
ENTRYPOINT java -jar metadata-service.jar