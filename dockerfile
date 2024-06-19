FROM maven:3.6.3 as builder

WORKDIR /app 
COPY . . 

RUN mvn package

FROM openjdk:8-alpine

COPY --from=builder /app/target/my-app-1.0-SNAPSHOT.jar /app.jar

CMD [ "java", "-jar", "app.jar" ]
